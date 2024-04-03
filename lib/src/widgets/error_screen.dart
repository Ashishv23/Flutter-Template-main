import 'package:flutter/material.dart';
import 'package:flutter_template/src/index.dart';

class ErrorScreen extends StatelessWidget {
  /// Creates an [ErrorScreen].
  const ErrorScreen(this.error, {Key? key}) : super(key: key);

  /// The error to display.
  final String error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('My "Page Not Found" Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectableText(error.toString()),
              TextButton(
                onPressed: () {},
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      );
}
