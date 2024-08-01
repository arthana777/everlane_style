


import '../domain/entities/category_entity.dart';


abstract class CategoryRepo {
  Future<List<CategoryEntity>> getCategoryFromDataSource();
  Future<List<CategoryEntity>> getSubCategoryFromDataSource(int id);
}
