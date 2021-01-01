part of 'shopping_item_details_cubit.dart';

@freezed
abstract class ShoppingItemDetailsState with _$ShoppingItemDetailsState {

  const factory ShoppingItemDetailsState.loading() = ShoppingItemDetailsLoading;
  const factory ShoppingItemDetailsState.loaded({@required List<Category> categories}) = ShoppingItemDetailsLoaded;

}
