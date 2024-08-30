class NotificationModel {
  String? verb;
  String? description;
  DateTime? timestamp;

  NotificationModel({
    required this.verb,
    required this.description,
    required this.timestamp,
  });

  // Factory constructor for creating a new NotificationModel instance from a map.
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      verb: json['verb'],
      description: json['description'],
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : null,
    );
  }

  // Method for converting a NotificationModel instance into a map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['verb'] = verb;
    data['description'] = description;
    data['timestamp'] = timestamp?.toIso8601String();
    return data;
  }
}
