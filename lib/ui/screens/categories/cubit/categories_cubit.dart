import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/services/respository/categories/categories_repository.dart';

part 'categories_cubit.freezed.dart';

part 'categories_state.dart';

@Injectable()
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _categoriesRepository;

  CategoriesCubit(this._categoriesRepository) : super(CategoriesLoading()) {
    refreshCategories();
  }

  Future<void> refreshCategories() {
    return _categoriesRepository
        .getCategories()
        .then((value) => emit(CategoriesLoaded(categories: value)));
  }

  Future<void> saveCategory(Category category, String previousCategoryName) {
    return _categoriesRepository.saveCategory(category, previousCategoryName).then((value) => refreshCategories());
  }

  Future<void> deleteCategory(Category category) {
    return _categoriesRepository.deleteCategory(category).then((value) => refreshCategories());
  }
}
