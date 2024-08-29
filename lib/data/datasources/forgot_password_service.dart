import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:everlane_style/data/models/forgot_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordService {
  final String baseUrl = 'https://18.143.206.136/api/forgot-password/';
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Dio user = Dio();

  Future<void> forgotPassword(String username) async {
    String? token = await getToken();
    final response = await user.post(
      baseUrl,
      options: Options(
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      ),
      data: jsonEncode(ForgotModel(username: username).toJson()),
    );
    print("datas${response.data}");
    print("Token:- ${token}");
    print("responce :- ${response.data['data']}");
    print("${response.statusCode}");
    if (response.statusCode == 200) {
      return response.data['message'] ?? "Data updated successfully!";
    }
  }
}
