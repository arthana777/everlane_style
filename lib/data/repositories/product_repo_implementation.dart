import 'package:everlane_style/data/datasources/product_datasource.dart';
import 'package:everlane_style/domain/entities/product_entity.dart';
import 'package:everlane_style/repository/product_repo.dart';

class ProductRepoImplementation extends ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource =
      ProductRemoteDataSourceimpl();
  @override
  Future<List<ProductEntity>> getProductFromDataSource() async {
    try {
      final productModels = await productRemoteDataSource.getProductFromApi();
      return productModels
          .map((model) => ProductEntity(
              id: model.id??0,
              name: model.name,
              description: model.description,
              price: model.price.toString(),
              brand: model.brand,
              subcategory: model.subcategory,
        createdOn: model.createdOn,
        isDeleted: model.isDeleted,
        isTrending: model.isTrending,
        items:   model.items,
        image: model.image,
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getSeasonsfromDatasource(String seasons) async{
    try {
      final productModels = await productRemoteDataSource.getSeasons(seasons);
      return productModels
          .map((model) => ProductEntity(
          id: model.id??0,
          name: model.name,
          description: model.description,
          price: model.price.toString(),
          brand: model.brand,
          subcategory: model.subcategory,
          image: model.image,
        createdOn: model.createdOn,
        isDeleted: model.isDeleted,
        isTrending: model.isTrending,
        items:   model.items,
          ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<List<ProductEntity>> getfiltercategory(int subcategory) async{
  //   try {
  //     final productModels = await productRemoteDataSource.getfiltercategory(subcategory);
  //     return productModels
  //         .map((model) => ProductEntity(
  //         id: model.id??0,
  //         name: model.name,
  //         description: model.description,
  //         price: model.price.toString(),
  //         brand: model.brand,
  //         subcategory: model.subcategory,
  //         //isTrending: model.isTrending,
  //       createdOn: model.createdOn,
  //       isDeleted: model.isDeleted,
  //       isTrending: model.isTrending,
  //       items:   model.items,
  //       image: model.image,
  //     ))
  //         .toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<List<ProductEntity>> getfiltercategoryDatasource(int subcategory)async {
    try {
      final productModels = await productRemoteDataSource.getfiltercategory(subcategory);
      return productModels
          .map((model) => ProductEntity(
          id: model.id??0,
          name: model.name,
          description: model.description,
          price: model.price.toString(),
          brand: model.brand,
          subcategory: model.subcategory,
          //isTrending: model.isTrending,
          image: model.image,
        createdOn: model.createdOn,
        isDeleted: model.isDeleted,
        isTrending: model.isTrending,
        items:   model.items,

          ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getDetailsProductDatasource(int id) async{ 
    try {
    final productModels = await productRemoteDataSource.getDetailsProduct(id);
    return productModels
        .map((model) => ProductEntity(
      id: model.id??0,
      name: model.name,
      description: model.description,
      price: model.price.toString(),
      brand: model.brand,
      subcategory: model.subcategory,
      //isTrending: model.isTrending,
      image: model.image,
      createdOn: model.createdOn,
      isDeleted: model.isDeleted,
      isTrending: model.isTrending,
      items:   model.items,


    ))
        .toList();
  } catch (e) {
    rethrow;
  }
  }


  
}
