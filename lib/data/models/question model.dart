class Data {
  final int? id;
  final String? gender;
  final String? skinColor; 
  final String? height;
  final String? preferredSeason; 
  final String? usageOfDress; 

  Data({
    this.id,
    this.gender,
    this.skinColor,
    this.height,
    this.preferredSeason,
    this.usageOfDress,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      gender: json['gender'],
      skinColor: json['skin_color'],
      height: json['height'],
      preferredSeason: json['preferred_season'],
      usageOfDress: json['usage_of_dress'],
    );
  }

  get data => null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'gender': gender,
        'skin_color': skinColor,
        'height': height,
        'preferred_season': preferredSeason,
        'usage_of_dress': usageOfDress,
      };
}
