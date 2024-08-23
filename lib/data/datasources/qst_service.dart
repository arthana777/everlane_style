import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QstService {
  String url = 'http://18.143.206.136/api/questionnaire/';

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Dio user = Dio();

  Future<String> updateQuestion(Map<String, dynamic> data) async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    try {
      final response = await user.patch(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      print("hhhh");
      print("response${response}");
      print("response${response.data}");
      if (response.statusCode == 201) {
        return response.data['message'];
      } else {
        return "Failed to upload";
      }
    } catch (e) {
      return "Something went wrong";
    }
  }
}
