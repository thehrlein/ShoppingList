import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

part 'shopping_list_cubit.freezed.dart';

part 'shopping_list_state.dart';

@Injectable()
class ShoppingListCubit extends Cubit<ShoppingListState> {
  final ShoppingListRepository _shoppingListRepository;
  StreamSubscription _shoppingListSubscription;

  ShoppingListCubit(this._shoppingListRepository) : super(ShoppingListLoading()) {
    _shoppingListSubscription = _shoppingListRepository.getAndListenToShoppingList(Constants.DOCUMENT_ACTIVE).listen((event) {
      emit(ShoppingListLoaded(shoppingList: event));
    });
  }

  Future<void> refreshShoppingList() {
    return _shoppingListRepository
        .getShoppingList(Constants.DOCUMENT_ACTIVE)
        .then((value) => emit(ShoppingListLoaded(shoppingList: value)));
  }

  Future<List<ShoppingListValueItem>> getQuerySuggestions(String query) {
    if (query.isEmpty) return Future.value(List.empty());
    return _shoppingListRepository.getSuggestions(query);
  }

  void onSuggestionSelected(ShoppingListValueItem shoppingItem) {
    saveShoppingItem(shoppingItem);
  }

  Future<void> saveShoppingItem(ShoppingListValueItem shoppingItem) {
    if (shoppingItem.name.isEmpty) return Future.value();
    return _shoppingListRepository.saveShoppingItem(shoppingItem);
  }

  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem) {
    return _shoppingListRepository.deleteShoppingItem(shoppingItem, Constants.DOCUMENT_ACTIVE);
  }

  @override
  Future<void> close() {
    _shoppingListSubscription.cancel();
    _shoppingListRepository.cancelStreamSubscription();
    return super.close();
  }
}
