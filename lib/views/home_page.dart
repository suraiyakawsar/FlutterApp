import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import '../model/user.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> usersFuture;
  bool isSwitched = false;
  int half = 0;

  @override
  void initState() {
    super.initState();
    usersFuture = getUsers(context);
  }

  Future<List<User>> getUsers(BuildContext context) async {
    List<User> user = [];

    // brings in data from the asset folder, json file
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/users.json');

    var list = json.decode(data);
    user = await list.map<User>(User.fromJson).toList();

    //shows half the data of the ones available, 5 in my case since data is 10
    half = (user.length / 2).round();

    //to sort list recent to old acc. to checkin time
    user.sort((a, b) {
      return (b.checkin).compareTo(a.checkin);
    });
    return user;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
          centerTitle: true,
          actions: [
            Switch(
              value: isSwitched,
              activeColor: Colors.black,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
            future: usersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(
                  '😢 ${snapshot.error}',
                  style: const TextStyle(fontSize: 20),
                );
              } else if (snapshot.hasData) {
                final users = snapshot.data!;
                return buildUsers(users);
              } else {
                return const Text('No User Data');
              }
            },
          ),
        ),
      );

  void share(BuildContext context, User user) {
    final String text = "${user.username} \n ${user.phone}";
    Share.share(text);
  }

  Future<void> _refreshUsers() async {}

  Widget buildUsers(List<User> users) => RefreshIndicator(
        onRefresh: _refreshUsers,
        edgeOffset: 10,
        displacement: 80,
        strokeWidth: 3,
        backgroundColor: Colors.red,
        color: Colors.white,
        child: ListView.builder(
          itemCount: half,
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
                  children: [Text(user.phone), const Spacer(), Text(isSwitched ? datetimeago : dateog)],
                ),
                trailing: IconButton(
                  onPressed: () {
                    share(context, user);
                  },
                  icon: const Icon(Icons.share),
                ),
              ),
            );
          },
        ),
      );
}
