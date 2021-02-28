import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/menu/menu_plan.dart';
import 'package:shopping_list/models/menu/menu_plan_day.dart';
import 'package:shopping_list/models/menu/menu_plan_item.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';

@Singleton(as: FirestoreDatasource)
class FirestoreDatasourceImpl implements FirestoreDatasource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference menuRef;
  CollectionReference shoppingListRef;
  CollectionReference categoryRef;

  final StreamController<List<ShoppingListValueItem>> _shoppingListController =
      StreamController.broadcast();
  final StreamController<Set<Category>> _categoriesController =
      StreamController.broadcast();
  final StreamController<MenuPlan> _menuPlanController =
  StreamController.broadcast();

  Stream get shoppingStream => _shoppingListController.stream;

  Stream get categoriesStream => _categoriesController.stream;
  Stream get menuStream => _menuPlanController.stream;

  StreamSubscription _activeShoppingListSubscription;
  StreamSubscription _categoriesSubscription;
  StreamSubscription _menuListSubscription;

  FirestoreDatasourceImpl() {
    menuRef = firestore.collection(Constants.COLLECTION_MENU);
    shoppingListRef = firestore.collection(Constants.COLLECTION_SHOPPING_LIST);
    categoryRef = firestore.collection(Constants.COLLECTION_CATEGORIES);
  }

  @override
  Future<List<ShoppingListValueItem>> getShoppingSuggestions(
      String query) async {
    List<ShoppingListValueItem> suggestions = [];
    final strFrontCode = query.substring(0, query.length - 1);
    final strEndCode = query.substring(query.length - 1, query.length);

    final limit =
        strFrontCode + String.fromCharCode(strEndCode.codeUnitAt(0) + 1);

    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(Constants.DOCUMENT_ALL)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .where(Constants.FIELD_NAME, isGreaterThanOrEqualTo: query)
        .where(Constants.FIELD_NAME, isLessThan: limit)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      suggestions.add(ShoppingListValueItem(category: category, name: name));
    });

    return suggestions;
  }

  @override
  Future<List<ShoppingListValueItem>> getShoppingList(String document) async {
    List<ShoppingListValueItem> items = [];
    QuerySnapshot querySnapshot = await shoppingListRef
        .doc(document)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      String category = map[Constants.FIELD_CATEGORY] ?? "Allgemein";
      items.add(ShoppingListValueItem(category: category, name: name));
    });

    return items;
  }

  @override
  Stream<List<ShoppingListValueItem>> getAndListenToShoppingList(
      String document) {
    _activeShoppingListSubscription = shoppingListRef
        .doc(document)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .snapshots()
        .listen((event) {
      List<ShoppingListValueItem> items = [];
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String name = map[Constants.FIELD_NAME];
        String category =
            map[Constants.FIELD_CATEGORY] ?? Constants.DEFAULT_CATEGORY;
        items.add(ShoppingListValueItem(category: category, name: name));
      });
      _shoppingListController.add(items);
    });
    return shoppingStream;
  }

  @override
  void cancelShoppingStreamSubscription() {
    if (_activeShoppingListSubscription != null) {
      _activeShoppingListSubscription.cancel();
      _activeShoppingListSubscription = null;
    }
  }

  @override
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem) async {
    await saveShoppingItemToCollection(Constants.DOCUMENT_ACTIVE, shoppingItem);
    await saveShoppingItemToCollection(Constants.DOCUMENT_ALL, shoppingItem);
  }

  Future<void> saveShoppingItemToCollection(
      String document, ShoppingListValueItem shoppingItem) async {
    var querySnapshot = await shoppingListRef
        .doc(document)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .where(Constants.FIELD_NAME, isEqualTo: shoppingItem.name)
        .where(Constants.FIELD_CATEGORY, isEqualTo: shoppingItem.category)
        .get();
    if (querySnapshot.docs.isNotEmpty) return Future.value();
    return shoppingListRef
        .doc(document)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .add({
      Constants.FIELD_NAME: shoppingItem.name,
      Constants.FIELD_CATEGORY:
          shoppingItem.category ?? Constants.DEFAULT_CATEGORY
    });
  }

  @override
  Future<void> editShoppingItem(ShoppingItemEditType editType,
      ShoppingListValueItem oldItem, ShoppingListValueItem newItem) async {
    if (editType == ShoppingItemEditType.ACTIVE) {
      // change active
      await deleteShoppingItem(
          oldItem, ShoppingItemEditType.ACTIVE.getDocument());
      await saveShoppingItemToCollection(
          ShoppingItemEditType.ACTIVE.getDocument(), newItem);
      // save to all
      await saveShoppingItemToCollection(
          ShoppingItemEditType.ALL.getDocument(), newItem);
    } else if (editType == ShoppingItemEditType.ALL) {
      // change active
      bool hadActiveItem = await deleteShoppingItem(
          oldItem, ShoppingItemEditType.ACTIVE.getDocument());
      if (hadActiveItem) {
        await saveShoppingItemToCollection(
            ShoppingItemEditType.ACTIVE.getDocument(), newItem);
      }
      // change all
      await deleteShoppingItem(oldItem, ShoppingItemEditType.ALL.getDocument());
      await saveShoppingItemToCollection(
          ShoppingItemEditType.ALL.getDocument(), newItem);
    }

    return Future.value();
  }

  @override
  Future<bool> deleteShoppingItem(
      ShoppingListValueItem shoppingItem, String document) async {
    var querySnapshot = await shoppingListRef
        .doc(document)
        .collection(Constants.SUB_COLLECTION_ITEMS)
        .where(Constants.FIELD_NAME, isEqualTo: shoppingItem.name)
        .where(Constants.FIELD_CATEGORY, isEqualTo: shoppingItem.category)
        .get();
    bool deleted = querySnapshot.docs.isNotEmpty;
    querySnapshot.docs.forEach((element) {
      element.reference.delete();
    });
    return deleted;
  }

  @override
  Future<MenuPlan> getMenuPlan() async {
    List<MenuPlanItem> planItems = [];
    QuerySnapshot querySnapshot = await menuRef.get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      int index = map[Constants.FIELD_INDEX] ?? -1;
      String dish = map[Constants.FIELD_DISH];
      planItems.add(MenuPlanItem(
          index: index, day: element.id.getMenuPlanDay(), dish: dish));
    });


    planItems
        .sort((a, b) => a.index.compareTo(b.index));

    return MenuPlan(plan: planItems);
  }

  @override
  Stream<MenuPlan> getAndListenToMenuPlan() {
    if (_menuListSubscription == null) {
      _menuListSubscription = menuRef.snapshots().listen((event) {
        List<MenuPlanItem> planItems = [];
        event.docs.forEach((element) {
          Map<String, dynamic> map = element.data();
          int index = map[Constants.FIELD_INDEX] ?? -1;
          String dish = map[Constants.FIELD_DISH];
          if (dish != null) {
            planItems.add(MenuPlanItem(
                index: index, day: element.id.getMenuPlanDay(), dish: dish));
          }
        });
        planItems
            .sort((a, b) => a.index.compareTo(b.index));
        _menuPlanController.add(MenuPlan(plan: planItems));
      });
    } else {
      _menuListSubscription.resume();
      getMenuPlan().then((value) => _menuPlanController.add(value));
    }

    return menuStream;
  }

  @override
  void pauseMenuStreamSubscription() {
    if (_menuListSubscription != null) {
      _menuListSubscription.pause();
    }
  }

  @override
  void saveNewMenuOrderedList(List<MenuPlanItem> items) {
    _menuListSubscription.pause();
    items.forEach((element) {
      menuRef.doc(element.day.toString()).set({
        Constants.FIELD_INDEX: element.index
      }, SetOptions(merge: true));
    });
    _menuListSubscription.resume();
  }

  @override
  Future<void> saveDish(MenuPlanItem menuPlanItem) {
    return menuRef.doc(menuPlanItem.day.toString()).set({
      Constants.FIELD_INDEX: menuPlanItem.index,
      Constants.FIELD_DISH: menuPlanItem.dish,
    }, SetOptions(merge: true));
  }

  @override
  Future<void> deleteDish(MenuPlanDay day) {
    return menuRef
        .doc(day.toString())
        .update({Constants.FIELD_DISH: FieldValue.delete()});
  }

  @override
  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    QuerySnapshot querySnapshot = await categoryRef.get();

    querySnapshot.docs.forEach((element) {
      Map<String, dynamic> map = element.data();
      String name = map[Constants.FIELD_NAME];
      categories.add(Category(name: name));
    });

    return categories;
  }

  @override
  Stream<Set<Category>> getAndListenToCategories() {
    _categoriesSubscription = categoryRef.snapshots().listen((event) {
      List<Category> categories = [];
      event.docs.forEach((element) {
        Map<String, dynamic> map = element.data();
        String name = map[Constants.FIELD_NAME];
        categories.add(Category(name: name));
      });
      categories
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      _categoriesController.add(categories.toSet());
    });
    return categoriesStream;
  }

  @override
  Future<void> saveCategory(Category category) {
    return categoryRef.add({Constants.FIELD_NAME: category.name});
  }

  @override
  Future<void> deleteCategory(Category category) async {
    var querySnapshot = await categoryRef
        .where(Constants.FIELD_NAME, isEqualTo: category.name)
        .get();
    querySnapshot.docs.forEach((element) {
      element.reference.delete();
    });
    return Future.value();
  }

  @override
  void cancelCategoryStreamSubscription() {
    if (_categoriesSubscription != null) {
      _categoriesSubscription.cancel();
      _categoriesSubscription = null;
    }
  }
}
