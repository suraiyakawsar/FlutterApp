import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Future future;
  final Widget child;

  const LoadingWidget({Key? key, required this.future, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // ignore: prefer_const_constructors
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text('😒 ${snapshot.error}'),
            );
          } else {
            print(build);
            return child;
          }
        }
      },
    );
  }
}
