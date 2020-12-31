part of 'shopping_list_cubit.dart';


@freezed
abstract class ShoppingListState with _$ShoppingListState {

  const factory ShoppingListState.loading() = ShoppingListLoading;
  const factory ShoppingListState.loaded({@required ShoppingList shoppingList}) = ShoppingListLoaded;

}
