import 'package:flutter/material.dart';
import 'package:flutter_template/src/screens/home/my_home_page.dart';

class HomeViewController extends StatefulWidget {
  const HomeViewController({Key? key}) : super(key: key);

  @override
  HomeControllerState createState() => HomeControllerState();
}

class HomeControllerState extends State<HomeViewController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}
