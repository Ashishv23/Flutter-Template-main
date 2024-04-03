import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/index.dart';
import 'package:flutter_template/src/screens/home/home_controller.dart';
import 'package:flutter_template/src/screens/login/login_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      navigatorKey: navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? Container(),
        );
        child = botToastBuilder(context, child);
        return child;
      },
      home: CupertinoTheme(
        data: MaterialBasedCupertinoThemeData(
          materialTheme: ThemeData(
            highlightColor: purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Poppins',
          ),
        ),
        child: getDefaultWidget(context),
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }

  Widget getDefaultWidget(BuildContext context) {
    Widget defaultWidget = const LoginViewController();
    if (AppManager.instance.sharedPreferenceRepository.isLoggedIn()) {
      defaultWidget = const HomeViewController();
    } else {
      defaultWidget = const LoginViewController();
    }
    return defaultWidget;
  }
}
