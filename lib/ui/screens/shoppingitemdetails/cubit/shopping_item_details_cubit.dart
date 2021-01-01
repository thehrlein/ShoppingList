import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/models/shopping/shopping_list_value_item.dart';
import 'package:shopping_list/services/respository/categories/categories_repository.dart';
import 'package:shopping_list/services/respository/shoppinglist/shopping_list_repository.dart';

part 'shopping_item_details_cubit.freezed.dart';

part 'shopping_item_details_state.dart';

@Injectable()
class ShoppingItemDetailsCubit extends Cubit<ShoppingItemDetailsState> {
  final CategoriesRepository _categoriesRepository;
  final ShoppingListRepository _shoppingListRepository;

  ShoppingItemDetailsCubit(
      this._categoriesRepository, this._shoppingListRepository)
      : super(ShoppingItemDetailsLoading()) {
    _categoriesRepository.getAndListenToCategories().listen((event) {
      emit(ShoppingItemDetailsLoaded(categories: event));
    });
  }

  Future<void> editShoppingItem(
      {@required ShoppingListValueItem newItem,
      @required ShoppingListValueItem oldItem}) {
    emit(ShoppingItemDetailsLoading());
    return _shoppingListRepository
        .deleteShoppingItem(oldItem)
        .then((value) => _shoppingListRepository.saveShoppingItem(newItem));
  }

  Future<void> deleteShoppingItem(ShoppingListValueItem item) {
    emit(ShoppingItemDetailsLoading());
    return _shoppingListRepository.deleteShoppingItem(item);
  }
}
