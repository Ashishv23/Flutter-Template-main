import 'package:flutter/material.dart';
import 'package:flutter_template/src/baseClass/app_bar.dart';
import 'package:flutter_template/src/index.dart';
import 'package:flutter_template/src/screens/home/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeControllerState controller;
  const HomeView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCS(
      keys: controller.scaffoldKey,
      csAppBar: AppBars(
        titleScreen: 'Home',
        scaffoldKey: controller.scaffoldKey,
        context: context,
        leftAppBarButton: LeftAppBarButton.empty,
      ),
      child: const Center(
        child: Text(
          'Welcome to Flutter Template',
        ),
      ),
    );
  }
}
