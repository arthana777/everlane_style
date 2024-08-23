import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofileservice {
  String url = 'http://18.143.206.136/api/profile/update/';

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  } 

  Dio user = Dio();

  Future<String> updateUserProfile(Map<String, dynamic> data) async {
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
      if (response.statusCode == 200) {
        return response.data['message'];
      }else{
       return "Failed to upload";
      }
    } catch (e) {
          return "Something went wrong";
    }
  }
}
