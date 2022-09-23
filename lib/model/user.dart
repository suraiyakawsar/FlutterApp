class User {
  final String username;
  final String phone;
  final String checkin;
  final String urlAvatar;

  const User({
    required this.username,
    required this.phone,
    required this.checkin,
    required this.urlAvatar,
  });

  static User fromJson(json) => User(
    username: json['username'],
    phone: json['phone'],
    checkin: json['checkin'],
    urlAvatar: json['urlAvatar'],
  );
}
