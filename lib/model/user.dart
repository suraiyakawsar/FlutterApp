class User {
  String username;
  String phone;
  DateTime checkin;
  String urlAvatar;

  User({
    required this.username,
    required this.phone,
    required this.checkin,
    required this.urlAvatar,
  });

  static User fromJson(json) => User(
        username: json['username'],
        phone: json['phone'],
        checkin: DateTime.parse(json['checkin']),
        urlAvatar: json['urlAvatar'],
      );
}
