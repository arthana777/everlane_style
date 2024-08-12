


import 'package:everlane_style/domain/entities/product_entity.dart';

import '../domain/entities/category_entity.dart';


abstract class ProductRepo {
  Future<List<ProductEntity>> getProductFromDataSource();
  Future<List<ProductEntity>> getSeasonsfromDatasource(String seasons);
  Future<List<ProductEntity>> getfiltercategoryDatasource(int subcategory);
  Future<List<ProductEntity>> getDetailsProductDatasource(int id);

}
