import 'package:flutter/material.dart';
import 'package:my_app/widget/loading_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../contact_list.dart';
import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  bool isSwitched = false;
  List<User> users = [];
  int newItemCount = 15;
  late Future loading;

  getSwitchValue() async {
    prefs = await SharedPreferences.getInstance();
    bool? prevIsSwitched = prefs.getBool('isSwitched');
    if (prevIsSwitched == null) {
      isSwitched = false;
    } else {
      isSwitched = prevIsSwitched;
    }
  }

  @override
  void initState() {
    getSwitchValue();

    users = allUsers;
    users.sort((a, b) {
      return (b.checkin).compareTo(a.checkin);
    });
    loading = _buildFuture();
    super.initState();
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  Future<void> _buildFuture() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    print("Future");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Contacts'),
      centerTitle: true,
      actions: [
        Switch(
          value: isSwitched,
          activeColor: Colors.black,
          onChanged: (bool value) async {
            prefs = await SharedPreferences.getInstance();
            setState(() {
              isSwitched = value;
              prefs.setBool('isSwitched', isSwitched);
              print('Saved state is $isSwitched');
            });
          },
        ),
      ],
    );
  }

  Widget buildBody() {
    return LoadingWidget(
      future: loading,
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("You have reached end of the list");
            } else if (mode == LoadStatus.loading) {
              body = const Center(child: CircularProgressIndicator());
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed! Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: _buildUsersList(),
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      if (newItemCount < users.length) {
        newItemCount += 5;
      } else {
        print("no more refreshing");
      }
    });

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (mounted) {
      setState(() {
        if (newItemCount < users.length) {
          newItemCount += 5;
        } else {
          print("no more loading");
        }
      });
    }

    _refreshController.refreshCompleted();
  }

  Widget _buildUsersList() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: newItemCount,
            itemBuilder: (context, index) => ContactList(
              users: users[index],
              isSwitched: isSwitched,
            ),
            itemExtent: 100.00,
          )
        ],
      ),
    );
  }
}
