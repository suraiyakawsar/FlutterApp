class User {
  String username;
  String phone;
  DateTime checkin;

  User({
    required this.username,
    required this.phone,
    required this.checkin,
  });

  // static User fromJson(json) => User(
  //       username: json['username'],
  //       phone: json['phone'],
  //       checkin: DateTime.parse(json['checkin']),
  //     );
}

List<User> allUsers = [
  User(username: "Chan Saw Lin", phone: "0152131113", checkin: DateTime.parse('2022-09-26 17:17:05')),
  User(username: "Lee Saw Loy", phone: "0161231346", checkin: DateTime.parse('2021-07-11 15:39:59')),
  User(username: "Khaw Tong Lin", phone: "0158398109", checkin: DateTime.parse('2022-08-19 11:10:18')),
  User(username: "Lim Kok Lin", phone: "0168279101", checkin: DateTime.parse('2020-07-11 15:39:59')),
  User(username: "Low Jun Wei", phone: "0112731912", checkin: DateTime.parse('2020-08-15 13:00:05')),
  User(username: "Yong Weng Kai", phone: "0172332743", checkin: DateTime.parse('2020-07-31 18:10:11')),
  User(username: "Jayden Lee", phone: "0191236439", checkin: DateTime.parse('2020-08-22 08:10:38')),
  User(username: "Kong Kah Yan", phone: "0111931233", checkin: DateTime.parse('2020-07-11 12:00:00')),
  User(username: "Jasmine Lau", phone: "0162879190", checkin: DateTime.parse('2020-08-01 12:10:05')),
  User(username: "Chan Saw Lin", phone: "016783239", checkin: DateTime.parse('2022-08-23 11:59:05')),
  User(username: "Chan Saw Lin", phone: "0152131113", checkin: DateTime.parse('2022-09-26 17:17:05')),
  User(username: "Lee Saw Loy", phone: "0161231346", checkin: DateTime.parse('2021-07-11 15:39:59')),
  User(username: "Khaw Tong Lin", phone: "0158398109", checkin: DateTime.parse('2022-08-19 11:10:18')),
  User(username: "Lim Kok Lin", phone: "0168279101", checkin: DateTime.parse('2020-07-11 15:39:59')),
  User(username: "Low Jun Wei", phone: "0112731912", checkin: DateTime.parse('2020-08-15 13:00:05')),
  User(username: "Yong Weng Kai", phone: "0172332743", checkin: DateTime.parse('2020-07-31 18:10:11')),
  User(username: "Jayden Lee", phone: "0191236439", checkin: DateTime.parse('2020-08-22 08:10:38')),
  User(username: "Kong Kah Yan", phone: "0111931233", checkin: DateTime.parse('2020-07-11 12:00:00')),
  User(username: "Jasmine Lau", phone: "0162879190", checkin: DateTime.parse('2020-08-01 12:10:05')),
  User(username: "Chan Saw Lin", phone: "016783239", checkin: DateTime.parse('2022-08-23 11:59:05')),
  User(username: "Chan Saw Lin", phone: "0152131113", checkin: DateTime.parse('2022-09-26 17:17:05')),
  User(username: "Lee Saw Loy", phone: "0161231346", checkin: DateTime.parse('2021-07-11 15:39:59')),
  User(username: "Khaw Tong Lin", phone: "0158398109", checkin: DateTime.parse('2022-08-19 11:10:18')),
  User(username: "Lim Kok Lin", phone: "0168279101", checkin: DateTime.parse('2020-07-11 15:39:59')),
  User(username: "Low Jun Wei", phone: "0112731912", checkin: DateTime.parse('2020-08-15 13:00:05')),
  User(username: "Yong Weng Kai", phone: "0172332743", checkin: DateTime.parse('2020-07-31 18:10:11')),
  User(username: "Jayden", phone: "0191236439", checkin: DateTime.parse('2020-08-22 08:10:38')),
  User(username: "Kong Kah Yan", phone: "0111931233", checkin: DateTime.parse('2020-07-11 12:00:00')),
  User(username: "Lau", phone: "0162879190", checkin: DateTime.parse('2020-08-01 12:10:05')),
  User(username: "Chan Lin", phone: "016783239", checkin: DateTime.parse('2022-08-23 11:59:05')),
];
