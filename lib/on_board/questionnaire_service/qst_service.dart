import 'dart:convert';
import 'package:everlane_style/on_board/question%20model/question%20model.dart';
import 'package:http/http.dart' as http;

class QstService {
  final String apiUrl = 'http://18.143.206.136/api/questionnaire/';
  final String token = 'token';

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
  }

  Future<QuestionModel> fetchQuestionnaire() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: getHeaders(),
    );
    print("Authorization token$token");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 401) {
      return QuestionModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load questionnaire');
    }
  }

  Future<QuestionModel> updateQuestionnaire(Data data) async {
    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: getHeaders(),
      body: jsonEncode(data.toJson()),
    );
    print("Authorization token$token");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 401) {
      print("heyloo");
      return QuestionModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update questionnaire');
    }
  }
}
