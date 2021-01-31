import 'package:shopping_list/models/categories/Category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();

  Stream<List<Category>> getAndListenToCategories();

  Future<void> saveCategory(Category category);

  Future<void> deleteCategory(Category category);

  void cancelSubscription();
}