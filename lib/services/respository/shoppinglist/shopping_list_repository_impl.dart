import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/categories/Category.dart';
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
  Future<ShoppingList> getShoppingList() {
    return _firestoreDatasource.getShoppingList().then((value) => _mapShoppingList(value));
  }

  @override
  Stream<ShoppingList> getAndListenToShoppingList() {
    return _firestoreDatasource
        .getAndListenToShoppingList()
        .map((event) => _mapShoppingList(event));
  }

  ShoppingList _mapShoppingList(List<ShoppingListValueItem> items) {
    Map<String, List<ShoppingListValueItem>> map = Map();
    items.forEach((element) {
      map.update(element.category, (value) {
        value.add(element);
        return value;
      }, ifAbsent: () {
        List<ShoppingListValueItem> items = List();
        items.add(element);
        return items;
      });
    });
    Map<Category, List<ShoppingListValueItem>> categoryMap = map.map((key, value) {
      return MapEntry(Category(name: key), value);
    });
    return ShoppingList(items: categoryMap);
  }

  @override
  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem) {
    return _firestoreDatasource.deleteShoppingItem(shoppingItem);
  }

  @override
  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem) {
    return _firestoreDatasource.saveShoppingItem(shoppingItem);
  }
}
