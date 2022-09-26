import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/model/user.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  runApp(
    MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<User> users = getUsers();

  static List<User> getUsers() {
    const data = [
      {"username": "Chan Saw Lin", "phone": "0152131113", "checkin": "2022-06-30 16:10:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Lee Saw Loy", "phone": "0161231346", "checkin": "2021-07-11 15:39:59", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Khaw Tong Lin", "phone": "0158398109", "checkin": "2022-08-19 11:10:18", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Lim Kok Lin", "phone": "0168279101", "checkin": "2020-07-11 15:39:59", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Low Jun Wei", "phone": "0112731912", "checkin": "2020-08-15 13:00:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Yong Weng Kai", "phone": "0172332743", "checkin": "2020-07-31 18:10:11", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Jayden Lee", "phone": "0191236439", "checkin": "2020-08-22 08:10:38", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Kong Kah Yan", "phone": "0111931233", "checkin": "2020-07-11 12:00:00", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Jasmine Lau", "phone": "0162879190", "checkin": "2020-08-01 12:10:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Chan Saw Lin", "phone": "016783239", "checkin": "2020-08-23 11:59:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
    ];
    return data.map<User>(User.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
        ),
        body: Center(
          child: buildUsers(users),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      );

  Widget buildUsers(List<User> users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final dateog = DateFormat('dd-MM-yyyy HH-mm-ss').format(user.checkin);
          final datetimeago = timeago.format(user.checkin);
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(user.username),
              subtitle: Row(
                children: [Text(user.phone), const Spacer(), Text(datetimeago)],
              ),
            ),
          );
        },
      );
}
