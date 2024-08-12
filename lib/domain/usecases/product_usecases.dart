import 'package:everlane_style/data/repositories/product_repo_implementation.dart';
import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/domain/entities/product_entity.dart';
import 'package:everlane_style/repository/product_repo.dart';

class ProductUsecases {
  final ProductRepo productRepo=ProductRepoImplementation();

  //ProductUsecases(this.productRepo);

  Future<List<ProductEntity>> getProductFromDatasource() async {

    final product = await productRepo.getProductFromDataSource();
    return product;
  }
  Future<List<ProductEntity>> getSeasonsfromDatasource(String seasons) async {
    final season = await productRepo.getSeasonsfromDatasource(seasons);
    return season;
  }
  Future<List<ProductEntity>> getfiltercategoryDatasource(int subcategory) async {
    final filtercategories = await productRepo.getfiltercategoryDatasource(subcategory);
    return filtercategories;
  }


  Future<List<ProductEntity>> getDetailsProductDatasource(int id) async {
    final productdetails = await productRepo.getDetailsProductDatasource(id);
    return productdetails;
  }
}
