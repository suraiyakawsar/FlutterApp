import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'model/user.dart';

class ContactList extends StatelessWidget {
  final User users;
  final bool isSwitched;

  const ContactList({Key? key, required this.users, required this.isSwitched}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dateog = DateFormat('dd-MM-yyyy HH:mm:ss').format(users.checkin);
    final datetimeago = timeago.format(users.checkin);

    return Card(
      child: ListTile(
        key: ValueKey(users),
        leading: const CircleAvatar(
          radius: 28,
          backgroundImage: null,
        ),
        title: Text(users.username),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              users.phone,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              isSwitched ? datetimeago : dateog,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            )
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            share(context, users);
          },
          icon: const Icon(Icons.share),
        ),
      ),
    );
  }

  void share(BuildContext context, User user) {
    final String text = "${user.username} \n ${user.phone}";
    Share.share(text);
  }
}
