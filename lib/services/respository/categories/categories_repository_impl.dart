import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shopping_list/models/categories/Category.dart';
import 'package:shopping_list/services/datasource/firebase/firestore_datasource.dart';
import 'package:shopping_list/services/respository/categories/categories_repository.dart';

@Singleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {

  final FirestoreDatasource _firestoreDatasource;

  CategoriesRepositoryImpl(this._firestoreDatasource);

  @override
  Future<List<Category>> getCategories() {
    return _firestoreDatasource.getCategories();
  }

  @override
  Stream<List<Category>> getAndListenToCategories() {
    return _firestoreDatasource.getAndListenToCategories().map((event) => event.toList());
  }

  @override
  Future<void> deleteCategory(Category category) {
    return _firestoreDatasource.deleteCategory(category);
  }

  @override
  Future<void> saveCategory(Category category) {
    return _firestoreDatasource.saveCategory(category);
  }

  @override
  void cancelSubscription() {
    return _firestoreDatasource.cancelCategoryStreamSubscription();
  }
}
