import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/shopping/shopping_item.dart';
import 'package:shopping_list/services/respository/menu/menu_repository.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

part 'shopping_list_cubit.freezed.dart';

part 'shopping_list_state.dart';

@Injectable()
class ShoppingListCubit extends Cubit<ShoppingListState> {
  final ShoppingListRepository _shoppingListRepository;

  ShoppingListCubit(this._shoppingListRepository) : super(ShoppingListLoading()) {
    _shoppingListRepository.getAndListenToShoppingList().listen((event) {
      emit(ShoppingListLoaded(shoppingList: event));
    });
  }

  Future<void> refreshShoppingList() {
    return _shoppingListRepository
        .getShoppingList()
        .then((value) => emit(ShoppingListLoaded(shoppingList: value)));
  }

  Future<List<ShoppingItem>> getQuerySuggestions(String query) {
    if (query.isEmpty) return Future.value(List.empty());
    return _shoppingListRepository.getSuggestions(query);
  }

  void onSuggestionSelected(ShoppingItem shoppingItem) {
    saveShoppingItem(shoppingItem);
  }

  Future<void> saveShoppingItem(ShoppingItem shoppingItem) {
    return _shoppingListRepository.saveShoppingItem(shoppingItem);
  }

  Future<void> deleteShoppingItem(ShoppingItem shoppingItem) {
    return _shoppingListRepository.removeShoppingItem(shoppingItem);
  }
}
