import 'package:flutter/cupertino.dart';
import 'package:flutter_template/src/screens/forgotPassword/forgot_password_controller.dart';
import 'package:flutter_template/src/screens/home/home_controller.dart';
import 'package:flutter_template/src/screens/login/login_controller.dart';
import 'package:flutter_template/src/widgets/error_screen.dart';

const String loginScreen = '/login';
const String forgotPasswordScreen = '/forgot-password';
const String homeScreen = '/home';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('Route ${settings.name}, ${settings.arguments}');

    // var queryData = Uri.splitQueryString(settings.name ?? '');
    // var arguments = settings.arguments;
    var routingData = settings.name?.getRoutingData;
    debugPrint('Query ${routingData?['query']}');

    // var mappedArg = convertBase64ToString(routingData?['query']);
    // debugPrint('Mapped Arg $mappedArg');

    return CupertinoPageRoute(
      maintainState: true,
      settings: settings,
      builder: (context) {
        switch (routingData?.route) {
          case loginScreen:
            return const LoginViewController();
          case forgotPasswordScreen:
            return const ForgotPasswordViewController();
          case homeScreen:
            return const HomeViewController();
          default:
            return const ErrorScreen('Route Not Found');
        }
      },
    );
  }
}

extension StringExtension on String {
  String toCapitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } else {
      return toUpperCase();
    }
  }

  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    debugPrint(
        'queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}

class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    required this.route,
    Map<String, String>? queryParameters,
  }) : _queryParameters = queryParameters ?? <String, String>{};

  operator [](String key) => _queryParameters[key];
}
