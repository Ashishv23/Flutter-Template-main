import 'package:flutter/material.dart';
import 'package:flutter_template/src/index.dart';

enum LeftAppBarButton { logout, back, empty, custom, menu }

enum RightAppBarButton {
  logout,
  back,
  empty,
  custom,
}

class ScaffoldCS extends Scaffold {
  final Widget child;
  late final GlobalKey<ScaffoldState> keys;
  final AppBar? csAppBar;
  final bool isSafeAreaRequired;
  final Widget? floatingMenu;
  @override
  final String? restorationId;

  ScaffoldCS(
      {this.csAppBar,
      this.restorationId,
      required this.child,
      required this.keys,
      this.floatingMenu,
      this.isSafeAreaRequired = true})
      : super(
          key: keys,
          restorationId: restorationId,
          drawerEnableOpenDragGesture: false,
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: csAppBar,
          body: isSafeAreaRequired ? SafeArea(child: child) : child,
          floatingActionButton: floatingMenu,
        );
}
