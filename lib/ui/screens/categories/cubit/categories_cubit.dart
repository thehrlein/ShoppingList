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
  StreamSubscription _categorySubscription;

  CategoriesCubit(this._categoriesRepository) : super(CategoriesLoading()) {
    _categorySubscription = _categoriesRepository.getAndListenToCategories().listen((event) {
      emit(CategoriesLoaded(categories: event));
    });
  }

  Future<void> refreshCategories() {
    return _categoriesRepository
        .getCategories()
        .then((value) => emit(CategoriesLoaded(categories: value)));
  }

  Future<void> saveCategory(Category category) {
    return _categoriesRepository.saveCategory(category);
  }

  Future<void> deleteCategory(Category category) {
    return _categoriesRepository.deleteCategory(category);
  }

  @override
  Future<void> close() {
    _categoriesRepository.cancelSubscription();
    if (_categorySubscription != null) {
      _categorySubscription.cancel();
      _categorySubscription = null;
    }
    return super.close();
  }
}
