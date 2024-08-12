


import 'package:everlane_style/domain/entities/product_entity.dart';

import '../domain/entities/category_entity.dart';


abstract class ProductRepo {
  Future<List<ProductEntity>> getProductFromDataSource();

}
