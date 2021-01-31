import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/app/utils/constants.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/models/shopping/shopping_list.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

part 'edit_shopping_items_cubit.freezed.dart';
part 'edit_shopping_items_state.dart';

@Injectable()
class EditShoppingItemsCubit extends Cubit<EditShoppingItemsState> {
  final ShoppingListRepository _shoppingListRepository;
  StreamSubscription _shoppingListSubscription;

  EditShoppingItemsCubit(this._shoppingListRepository) : super(EditShoppingItemsLoading()) {
    _shoppingListSubscription = _shoppingListRepository.getAndListenToShoppingList(Constants.DOCUMENT_ALL).listen((event) {
      emit(EditShoppingItemsLoaded(shoppingList: event));
    });
  }

  Future<void> refreshShoppingList() {
    return _shoppingListRepository
        .getShoppingList(Constants.DOCUMENT_ALL)
        .then((value) => emit(EditShoppingItemsLoaded(shoppingList: value)));
  }

  Future<void> deleteShoppingItem(ShoppingListValueItem shoppingItem) {
    return _shoppingListRepository.deleteShoppingItem(shoppingItem, Constants.DOCUMENT_ALL);
  }

  @override
  Future<void> close() {
    _shoppingListRepository.cancelStreamSubscription();
    if (_shoppingListSubscription != null) {
      _shoppingListSubscription.cancel();
      _shoppingListSubscription = null;
    }
    return super.close();
  }


}
