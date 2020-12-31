import 'package:shopping_list/models/categories/Category.dart';

abstract class CategoriesRepository {

  Stream<List<Category>> getAndListenToCategories();
  Future<void> saveCategory(Category category);
  Future<void> deleteCategory(Category category);
}