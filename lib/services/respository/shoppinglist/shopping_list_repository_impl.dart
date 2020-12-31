import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

@Singleton(as: ShoppingListRepository)
class ShoppingListRepositoryImpl implements ShoppingListRepository {

  final FirestoreDatasource _firestoreDatasource;

  ShoppingListRepositoryImpl(this._firestoreDatasource);

  @override
  Future<List<ShoppingItem>> getSuggestions(String query) {
    return _firestoreDatasource.getShoppingSuggestions(query);
  }

  @override
  Future<ShoppingList> getShoppingList() {
    return _firestoreDatasource.getShoppingList();
  }

  @override
  Stream<ShoppingList> getAndListenToShoppingList() {
    return _firestoreDatasource.getAndListenToShoppingList();
  }

  @override
  Future<void> removeShoppingItem(ShoppingItem shoppingItem) {
    return _firestoreDatasource.removeShoppingItem(shoppingItem);
  }

  @override
  Future<void> saveShoppingItem(ShoppingItem shoppingItem) {
    return _firestoreDatasource.saveShoppingItem(shoppingItem);
  }

}