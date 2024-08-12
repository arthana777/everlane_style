import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:everlane_style/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductFromApi();

}

class ProductRemoteDataSourceimpl extends ProductRemoteDataSource{
  final client = http.Client();
  @override
  Future<List<ProductModel>> getProductFromApi() async {
    try {
      final response = await client.get(
        Uri.parse('https://xd7q7vf5-8000.inc1.devtunnels.ms/api/categories/'),
        headers: {
          'content-type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final List<dynamic> categoryList = responseBody['data'];

        final List<ProductModel> products = categoryList.map((json) => ProductModel.fromJson(json)).toList();
        print(products);
        return products;
      } else {
        throw Exception("Failed to load categories${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }

}
