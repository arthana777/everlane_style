import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:everlane_style/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProductFromApi();
  Future<List<Product>> getSeasons(String season);
  Future<List<Product>> getfiltercategory(int id);
  Future<List<Product>> getDetailsProduct(int id);


}

class ProductRemoteDataSourceimpl extends ProductRemoteDataSource {
  final client = http.Client();

  @override
  Future<List<Product>> getProductFromApi() async {
    try {
      final response = await client.get(
        Uri.parse('http://18.143.206.136/api/products/trending/'),
        headers: {
          'content-type': 'application/json',
        },
      );
      print("trending products..${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
print("llllllllll${responseBody.length}");
        final List<dynamic> categoryList = responseBody['data'];
print("uuuuuuuuu${categoryList.length}");
        final List<Product> products = categoryList.map((json) => Product.fromJson(json)).toList();
        // final List<Product> products = categoryList.map((json) =>
        //     Product.fromJson(json)).toList();
        print("ppppppppppp${products.length}");
        return products;
      } else {
        throw Exception("Failed to load products${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }

  @override
  Future<List<Product>> getSeasons(String season) async {
    print("http://18.143.206.136/api/products/$season/");
    try {
      final response = await client.get(
        Uri.parse('http://18.143.206.136/api/products/$season/'),
        headers: {
          'content-type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
         print("seasonssss${responseBody}");
        final List<dynamic> productList = responseBody['data'];
        final List<Product> seasons = productList.map((json) =>
            Product.fromJson(json)).toList();
        print("hereeeeeee${seasons}");
        return seasons;
      } else {
        throw Exception("Failed to load products${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }

  @override
  Future<List<Product>> getfiltercategory(int subcategory) async{
    print("http://18.143.206.136/api/products/?subcategory=$subcategory");
    try {
      final response = await client.get(
        Uri.parse('http://18.143.206.136/api/products/?subcategory=$subcategory'),
        headers: {
          'content-type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        print( responseBody['data']);
        final List<dynamic> productList = responseBody['data'];

        final List<Product> filtercategories = productList.map((json) =>
            Product.fromJson(json)).toList();
        print(filtercategories);
        return filtercategories;
      } else {
        throw Exception("Failed to load products${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }

  @override
  Future<List<Product>> getDetailsProduct(int id)async {
    print("http://18.143.206.136/api/products/$id/");
    try {
      final response = await client.get(
        Uri.parse('http://18.143.206.136/api/products/$id/'),
        headers: {
          'content-type': 'application/json',
        },
      );
      print("details products..${response.body}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final List<dynamic> categoryList = responseBody['data'];

        final List<Product> productdetails = categoryList.map((json) =>
            Product.fromJson(json)).toList();
        print(productdetails);
        return productdetails;
      } else {
        throw Exception("Failed to load products${response.statusCode}");
      }
    } catch (e) {
      print(e);
      throw Exception("$e");
    }
  }
}
