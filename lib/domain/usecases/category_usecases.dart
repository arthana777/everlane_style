import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/repository/category_repo.dart';
import 'package:everlane_style/data/repositories/category_repo_impl.dart';

class CategoryUsecases {
  final CategoryRepo categoryRepo = CategoryRepoImplementation();


  Future<List<CategoryEntity>> getCategoryFromDataSource() async {
    final category = await categoryRepo.getCategoryFromDataSource();
    return category;
  }
  Future<List<CategoryEntity>> getSubCategoryFromDataSource(int id) async {
    final category = await categoryRepo.getSubCategoryFromDataSource(id);
    return category;
  }


}
