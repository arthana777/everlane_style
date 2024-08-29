
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:everlane_style/bloc/address/address_bloc.dart';
import 'package:everlane_style/data/models/addressmodel.dart';
import 'package:everlane_style/data/models/disastermodel.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../sharedprefrence/sharedprefs_login.dart';
import '../models/pickupmodel.dart';
class UseraddressDatasourse{
  final client = http.Client();
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('auth_token');
    print("stringvalueee${stringValue}");
    return stringValue;
  }
  Future<dynamic> getAddress() async {
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }
    print("https://18.143.206.136/api/addresses/");
    try {
      final response = await client.get(
        Uri.parse('https://18.143.206.136/api/addresses/'),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
      );
      if (response.statusCode == 200) {
        print("Successful response: ${response.body}");
        final Map<String, dynamic> responseBody = jsonDecode(response.body);


        if (responseBody['data'] != null && responseBody['data'] is List) {
          final List<dynamic> dataList = responseBody['data'];
        final List<UserAddress> useradress = dataList.map((json) =>
            UserAddress.fromJson(json)).toList();
        print(useradress.length);
        return useradress;
      } else {
          // Return an empty list if 'data' is null or not a list
          return <UserAddress>[];
        }
      } else {
        print("Failed with status code: ${response.statusCode}");
        throw Exception("Failed to load userdata ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("$e");
    }
  }


  Future<String> DeleteAddress(int aid) async {
    print("piddddddd$aid");
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }
    final SharedPrefeService sp = SharedPrefeService();
    try {
      final response = await http.delete(
        Uri.parse('https://18.143.206.136/api/addresses/$aid/delete/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
        body: jsonEncode({
          'id': aid
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        print("ytytytyt${decodedResponse}");
        if (decodedResponse['message'] ==
            "Address deleted successfully.") {
          // await getToken(token);
          return "success";
        }
        else {
          return "Failed: ${decodedResponse['message']}";
        }
        // Login successful, proceed to next step
      }
    } catch (e) {
      return "Failed: ${e.toString()}";
    }
    return "true";
  }

  Future<String> createAddress(
       String mobile,
       String pincode,
       String locality,
       String address,
       String city,
       String state,
       String landmark,
       bool isDefault,
       bool isActive,
       bool isDeleted,) async {
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }
    // final SharedPrefeService sp = SharedPrefeService();
    try {
      final response = await http.post(
        Uri.parse('https://18.143.206.136/api/addresses/create/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
        body: jsonEncode(<String,dynamic>{
          'mobile': mobile,
          'pincode': pincode,
          'locality': locality,
          'address': address,
          'city': city,
          'state': state,
          'landmark': landmark,
          'is_default': isDefault,
          'is_active': isActive,
          'is_deleted': isDeleted,
        }),
      );
      print(response.body);
      if (response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);
        print("ytytytyt${decodedResponse}");
        if (decodedResponse['message'] ==
            "Address created successfully.") {
          // await getToken(token);
          return "success";
        }
        else {
          return "Failed: ${decodedResponse['message']}";
        }
        // Login successful, proceed to next step
      }
    } catch (e) {
      return "Failed: ${e.toString()}";
    }
    return "true";
  }



  Future<String> DisasterReg(
      String name,
      String adhar,
      String location,
      String description,
      int requiredMenDresses,
      int requiredWomenDresses,
      int requiredKidsDresses,
      //int user,
      ) async {
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }

    try {
      final response = await http.post(
        Uri.parse('https://18.143.206.136/api/disasters/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
        body: jsonEncode(<String, dynamic>{

          'name': name,
          'adhar': adhar,
          'location': location,
          'description': description,
          'required_men_dresses': requiredMenDresses,
          'required_women_dresses': requiredWomenDresses,
          'required_kids_dresses': requiredKidsDresses,
         // 'user': user,

        }),
      );

      print(response.body);
      if (response.statusCode == 201) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['message'] == "Address created successfully.") {
          return "success";
        } else {
          return "Failed: ${decodedResponse['message']}";
        }
      }
    } catch (e) {
      return "Failed: ${e.toString()}";
    }
    return "true";
  }

  Future<dynamic> getDisasterlist() async {
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }
    print("https://18.143.206.136/api/disasters/");
    try {
      final response = await client.get(
        Uri.parse('https://18.143.206.136/api/disasters/'),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
      );
      if (response.statusCode == 200) {
        print("Successful response: ${response.body}");
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final List<dynamic> dataList = responseBody['data'];

        final List<Disaster> disasteradress = dataList.map((json) =>
            Disaster.fromJson(json)).toList();
        print(disasteradress.length);
        return disasteradress;
      } else {
        print("Failed with status code: ${response.statusCode}");
        throw Exception("Failed to load userdata ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("$e");
    }
  }

  // Future<String> uploadCloths(int disid, List<File> images) async {
  //   print("piddddddd");
  //   final String? stringValue = await getToken();
  //   if (stringValue == null || stringValue.isEmpty) {
  //     return "Failed: Token not found or is empty";
  //   }
  //   final SharedPrefeService sp = SharedPrefeService();
  //   try {
  //     final response = await http.post(
  //       Uri.parse('http://18.143.206.136/api/donations/'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Token $stringValue',
  //       },
  //       body: jsonEncode({
  //         'disaster':disid,
  //         'images':images,
  //       }),
  //     );
  //     print(response.body);
  //     if (response.statusCode == 201) {
  //       final decodedResponse = jsonDecode(response.body);
  //       print("ytytytyt${decodedResponse}");
  //       if (decodedResponse['message'] ==
  //           "Product added to wishlist successfully.") {
  //         // await getToken(token);
  //         return "success";
  //       }
  //       else {
  //         return "Failed: ${decodedResponse['message']}";
  //       }
  //       // Login successful, proceed to next step
  //     }
  //   } catch (e) {
  //     return "Failed: ${e.toString()}";
  //   }
  //   return "true";
  // }



  // Future<String> uploadCloths(int disid, List<File> images) async {
  //   print("disasaterid${disid} ");
  //   print("imagesindatasorc${images}");
  //   final String? token = await getToken();
  //   if (token == null || token.isEmpty) {
  //     return "Failed: Token not found or is empty";
  //   }
  //
  //   final dio = Dio();
  //   final uri = 'http://18.143.206.136/api/donations/';
  //
  //   try {
  //     final formData = FormData.fromMap({
  //       'disaster': disid.toString(),
  //       'images': await Future.wait(images.map((image) async {
  //         return MultipartFile.fromFile(image.path, filename: image.uri.pathSegments.last);
  //       }).toList())
  //     });
  //
  //     final response = await dio.post(
  //       uri,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Token $token',
  //         },
  //       ),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       final decodedResponse = jsonDecode(response.data);
  //       if (decodedResponse['message'] == "Product added to wishlist successfully.") {
  //         return "success";
  //       } else {
  //         return "Failed: ${decodedResponse['message']}";
  //       }
  //     } else {
  //       return "Failed: ${response.statusMessage}";
  //     }
  //   } catch (e) {
  //     return "Failed: ${e.toString()}";
  //   }
  // }

  Future<String> uploadCloths(int disid, List<File> images) async {
    print("disasterId: $disid ");
    print("image length: ${images}");
    final String? token = await getToken();
    if (token == null || token.isEmpty) {
      return "Failed: Token not found or is empty";
    }

    final dio = Dio();
    final uri = 'https://18.143.206.136/api/donations/';

    try {

      final imageFiles = await Future.wait(images.map((image) async {
        //return MultipartFile.fromFile(image.path, filename: path.basename(image.path));
        return MultipartFile.fromFile(image.path, filename: image.uri.pathSegments.last);
      }).toList());
        final formData = FormData.fromMap({
          'disaster': disid,
          // disid.toString(),
          'images':imageFiles
          //'images': await MultipartFile.fromFile(image.path, filename: image.uri.pathSegments.last),
        });
print("formdataaa${formData}");
      print("response of upload image ");

        final response = await dio.post(
          uri,
          data: formData,
          options: Options(
            validateStatus: (status) => true,
            headers: {
              'Authorization': 'Token $token',
              'Content-Type': 'multipart/form-data',
            },
          ),
        );
print("response of upload image $response");
        if (response.statusCode != 200) {
          return "Failed: ${response.statusMessage}";
        }

        final decodedResponse = jsonDecode(response.data);
        if (decodedResponse['message'] != "Product added to wishlist successfully.") {
          return "Failed: ${decodedResponse['message']}";
        }


      return "success";
    } catch (e) {
      return "Failed: ${e.toString()}";
    }
  }




  Future<dynamic> getPickuplocations() async {
    final String? stringValue = await getToken();
    if (stringValue == null || stringValue.isEmpty) {
      return "Failed: Token not found or is empty";
    }
    print("https://18.143.206.136/api/pickups/");
    try {
      final response = await client.get(
        Uri.parse('https://18.143.206.136/api/pickups/'),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Token $stringValue',
        },
      );
      if (response.statusCode == 200) {
        print("Successful response: ${response.body}");
        final Map<String, dynamic> responseBody = jsonDecode(response.body);


        if (responseBody['data'] != null && responseBody['data'] is List) {
          final List<dynamic> dataList = responseBody['data'];
          final List<PickupLocation> pickuplocations = dataList.map((json) =>
              PickupLocation.fromJson(json)).toList();
          print("lengthhhofpickuplocations${pickuplocations.length}");
          return pickuplocations;
        } else {
          // Return an empty list if 'data' is null or not a list
          return <PickupLocation>[];
        }
      } else {
        print("Failed with status code: ${response.statusCode}");
        throw Exception("Failed to load userdata ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception("$e");
    }
  }


}