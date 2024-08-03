import 'package:everlane_style/data/datasources/product_datasource.dart';
import 'package:everlane_style/domain/entities/product_entity.dart';
import 'package:everlane_style/repository/product_repo.dart';


class ProductRepoImplementation extends ProductRepo{
  final ProductRemoteDataSource productRemoteDataSource=ProductRemoteDataSourceimpl();
  @override
  Future<List<ProductEntity>> getProductFromDataSource() async {
    try {
      final productModels = await productRemoteDataSource.getProductFromApi();
      return productModels.map((model) => ProductEntity(
          isTrending: model.rainy,
          summer: model.summer,
          winter: model.winter,
        rainy: model.rainy,
        autumn: model.autumn,

      )).toList();
    } catch (e) {
      rethrow;
    }
  }
}