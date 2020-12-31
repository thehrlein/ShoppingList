part of 'categories_cubit.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {

  const factory CategoriesState.loading() = CategoriesLoading;
  const factory CategoriesState.loaded({@required List<Category> categories}) = CategoriesLoaded;

}
