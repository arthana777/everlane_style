class QuestionModel {
  final String? status;
  final String? message;
  final int? responseCode;
  final Data? data;

  QuestionModel({this.status, this.message, this.responseCode, this.data});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      status: json['status'],
      message: json['message'],
      responseCode: json['response_code'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'response_code': responseCode,
        if (data != null) 'data': data!.toJson(),
      };
}

class Data {
  final int? id;
  final String? gender;
  final String? skin_color;
  final String? height;
  final String? preferred_season;
  final String? usage_of_dress;

  Data({
    this.id,
    this.gender,
    this.skin_color,
    this.height,
    this.preferred_season,
    this.usage_of_dress,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      gender: json['gender'],
      skin_color: json['skin_color'],
      height: json['height'],
      preferred_season: json['preferred_season'],
      usage_of_dress: json['usage_of_dress'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'gender': gender,
        'skin_color': skin_color,
        'height': height,
        'preferred_season': preferred_season,
        'usage_of_dress': usage_of_dress,
      };
}
