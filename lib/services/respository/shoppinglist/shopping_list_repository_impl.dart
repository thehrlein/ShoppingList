import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_item_edit_type.dart';
import 'package:shopping_list/models/shopping/shopping_list_header_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_item.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

@Singleton(as: ShoppingListRepository)
class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final FirestoreDatasource _firestoreDatasource;

  ShoppingListRepositoryImpl(this._firestoreDatasource);

  @override
  Future<List<ShoppingListValueItem>> getSuggestions(String query) {
    return _firestoreDatasource.getShoppingSuggestions(query);
  }

  @override
  Future<ShoppingList> getShoppingList(String document) {
    return _firestoreDatasource.getShoppingList(document).then((value) => _mapShoppingList(value));
  }

  @override
  Stream<ShoppingList> getAndListenToShoppingList(String document) {
    return _firestoreDatasource
        .getAndListenToShoppingList(document)
        .map((event) => _mapShoppingList(event));
  }

  @override
  void cancelStreamSubscription() {
    return _firestoreDatasource.cancelShoppingStreamSubscription();
  }

  ShoppingList _mapShoppingList(List<ShoppingListValueItem> items) {
    Map<String, List<ShoppingListValueItem>> map = Map();
    items.forEach((element) {
      map.update(element.category, (value) {
        value.add(element);
        return value;
      }, ifAbsent: () {
        List<ShoppingListValueItem> items = [];
        items.add(element);
        return items;
      });
    });
    Map<Category, List<ShoppingListValueItem>> categoryMap = map.map((key, value) {
      // sort items inside a category
      value.sort((a,b) => a.compareTo(b));
      return MapEntry(Category(name: key), value);
    });

    // sort categories
    final sortedMap = SplayTreeMap.from(categoryMap, (a, b) => a.compareTo(b));

    List<ShoppingListItem> list = [];
    sortedMap.forEach((key, value) {
      list.add(ShoppingListHeaderItem(category: key));
      value.forEach((element) {
        list.add(element);
      });
    });

    return ShoppingList(items: list);
  }

  @override
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem, String document) {
    return _firestoreDatasource.deleteShoppingItem(shoppingItem, document);
  }

  @override
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem) {
    return _firestoreDatasource.saveShoppingItem(shoppingItem);
  }

  @override
  Future<void> editShoppingItem(ShoppingItemEditType editType, ShoppingListValueItem oldItem, ShoppingListValueItem newItem) {
    return _firestoreDatasource.editShoppingItem(editType, oldItem, newItem);
  }
}
