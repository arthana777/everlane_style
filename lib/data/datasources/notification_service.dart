import 'package:dio/dio.dart';
import 'package:everlane_style/data/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  final String baseUrl = "http://18.143.206.136/api/notification/";
 

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
 final Dio dio = Dio();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<NotificationModel> fetchNotifications() async {
    String? token = await getToken();
    if (token == null) {
      throw Exception('Token not found');
    }
    NotificationModel notificationModel;
    final response = await dio.get(
      baseUrl,
      options: Options(
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    print("datas${response.data}");
    print("Token:- ${token}");
    print("responce${response.data['data']}");
    print("${response.statusCode}");

    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(response.data['data']);

      print("hehehe kittyy ${response.data['data']}");

      return notificationModel;
    } else {
      return
      throw Exception('Failed to load profile');
    }
  }
}
