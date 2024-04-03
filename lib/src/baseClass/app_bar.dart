import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/src/index.dart';

class AppBars extends AppBar {
  final LeftAppBarButton leftAppBarButton;
  final Builder? leftBuilder;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final RightAppBarButton? rightAppBarButton;
  final List<CustomAppBarIconButton>? rightBuilder;
  final bool isNeedGradientAppBar;
  final List<Color>? appBarBackgroundColors;
  final String titleScreen;
  final BuildContext context;
  @override
  // ignore: overridden_fields
  final Color? backgroundColor;

  AppBars(
      {Key? key,
      this.leftAppBarButton = LeftAppBarButton.back,
      this.leftBuilder,
      required this.scaffoldKey,
      this.rightAppBarButton = RightAppBarButton.empty,
      this.isNeedGradientAppBar = true,
      this.appBarBackgroundColors,
      this.titleScreen = '',
      this.backgroundColor,
      required this.context,
      this.rightBuilder})
      : super(
          key: key,
          centerTitle: true,
          elevation: 0.0,
          titleSpacing: 16.0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: darkBlue,
          ),
          leading: leftAppBarButton == LeftAppBarButton.empty
              ? null
              : buildLeftBuilder(
                  leftAppBarButton,
                  leftBuilder ??
                      Builder(builder: (context) {
                        return Container();
                      }),
                  scaffoldKey),
          backgroundColor: isNeedGradientAppBar
              ? Colors.transparent
              : (backgroundColor ?? purple),
          title: Container(
              color: Colors.transparent,
              child: buildTitleText(context, titleScreen)),
          actions: rightAppBarButton == RightAppBarButton.empty
              ? null
              : buildRightBuilder(context, rightAppBarButton,
                  rightBuilder ?? <CustomAppBarIconButton>[]),
        );
}

Builder buildLeftBuilder(LeftAppBarButton leftAppBarButton, Builder leftBuilder,
    GlobalKey<ScaffoldState> scaffoldKey) {
  if (leftAppBarButton == LeftAppBarButton.custom) {
    return leftBuilder;
  } else {
    return Builder(
      builder: (BuildContext context) {
        if (leftAppBarButton == LeftAppBarButton.back) {
          return CustomAppBarIconButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        } else if (leftAppBarButton == LeftAppBarButton.menu) {
          return CustomAppBarIconButton(
            icon: Icons.sort,
            onPressed: () async {
              scaffoldKey.currentState?.openDrawer();
            },
          );
        } else {
          return CustomAppBarIconButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }
      },
    );
  }
}

Widget buildTitleText(BuildContext context, String title) {
  return Row(
    children: [
      Text(
        AppLocalizations.of(context)!.appTitle,
        style: appBarTitleText(),
        textAlign: TextAlign.start,
      ),
    ],
  );
}

List<CustomAppBarIconButton> buildRightBuilder(
    BuildContext context,
    RightAppBarButton? rightAppBarButton,
    List<CustomAppBarIconButton> rightBuilder) {
  if (rightAppBarButton == RightAppBarButton.custom) {
    return rightBuilder;
  } else if (rightAppBarButton == RightAppBarButton.logout) {
    return [
      CustomAppBarIconButton(
        icon: Icons.exit_to_app,
        onPressed: () {
          // Navigator.of(context).pushReplacementNamed(loginScreen);
        },
      )
    ];
  } else {
    return [
      CustomAppBarIconButton(
        icon: Icons.exit_to_app,
        onPressed: () {
          // Navigator.of(context).pushReplacementNamed(loginScreen);
        },
      )
    ];
  }
}
