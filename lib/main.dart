import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/model/user.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:toggle_switch/toggle_switch.dart';
// import 'dart:math';
// import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MainPage(),
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
  List<bool> isSelected = [true, false];

  // final List<bool> _selections = List.generate(2, (_) => false);
  var TxtBold = FontWeight.normal;
  var TxtItalic = FontStyle.normal;
  var TxtUnder = TextDecoration.none;

  static List<User> getUsers() {
    List<User> _user = [];

    const data = [
      {"username": "Chan Saw Lin", "phone": "0152131113", "checkin": "2022-09-26 17:17:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Lee Saw Loy", "phone": "0161231346", "checkin": "2021-07-11 15:39:59", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Khaw Tong Lin", "phone": "0158398109", "checkin": "2022-08-19 11:10:18", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Lim Kok Lin", "phone": "0168279101", "checkin": "2020-07-11 15:39:59", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Low Jun Wei", "phone": "0112731912", "checkin": "2020-08-15 13:00:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Yong Weng Kai", "phone": "0172332743", "checkin": "2020-07-31 18:10:11", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Jayden Lee", "phone": "0191236439", "checkin": "2020-08-22 08:10:38", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Kong Kah Yan", "phone": "0111931233", "checkin": "2020-07-11 12:00:00", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Jasmine Lau", "phone": "0162879190", "checkin": "2020-08-01 12:10:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
      {"username": "Chan Saw Lin", "phone": "016783239", "checkin": "2022-08-23 11:59:05", "urlAvatar": "https://images.unsplash.com/photo-1581403341630-a6e0b"},
    ];

    _user = data.map<User>(User.fromJson).toList();
    _user.sort((a, b) {
      return (b.checkin).compareTo(a.checkin);
    });
    return _user;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: buildUsers(users),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              height: 50,
              child: Align(
                alignment: Alignment.topLeft,
                child: _toggleButtons(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: ClipRect(
            child: Align(
              heightFactor: 0.5,
              child: _toggleButtons(),
            ),
          ),
        ),
      );

  Future<void> _refreshUsers() async {}

  Widget buildUsers(List<User> users) => RefreshIndicator(
        onRefresh: _refreshUsers,
        edgeOffset: 10,
        displacement: 80,
        strokeWidth: 3,
        backgroundColor: Colors.red,
        color: Colors.white,
        child: ListView.builder(
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
        ),
      );



  _toggleButtons() {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
      isSelected: isSelected,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Original Time'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Time ago'),
        ),
      ],
    );
  }
}
