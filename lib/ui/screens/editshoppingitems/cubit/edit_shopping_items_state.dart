part of 'edit_shopping_items_cubit.dart';


@freezed
abstract class EditShoppingItemsState with _$EditShoppingItemsState {

  const factory EditShoppingItemsState.loading() = EditShoppingItemsLoading;
  const factory EditShoppingItemsState.loaded({@required ShoppingList shoppingList}) = EditShoppingItemsLoaded;

}
