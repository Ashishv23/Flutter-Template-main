import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/index.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await AppManager.instance.initSharedPreference();
  runApp(const MyApp());
}
