import 'package:flutter/material.dart';
import 'package:flutter_template/src/bloc/login_bloc.dart';
import 'package:flutter_template/src/index.dart';
import 'package:flutter_template/src/screens/login/login_screen.dart';

class LoginViewController extends StatefulWidget {
  const LoginViewController({Key? key}) : super(key: key);

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<LoginViewController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginBloc loginBloc = LoginBloc();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    loginBloc.errorSubject.listen((error) {
      showErrorMessage(error, scaffoldKey.currentState!);
    });

    loginBloc.isLoading.listen((value) {
      if (value) {
        showIndicator(AppLocalizations.of(context)!.please_wait,
            scaffoldKey.currentState!);
      } else {
        hideIndicator(scaffoldKey.currentState!);
      }
    });

    loginBloc.loginResponse.listen((response) async {
      if (response.data?.id != null) {
        AppManager.instance.sharedPreferenceRepository
            .saveLoginResponse(response);
        AppManager.instance.sharedPreferenceRepository.saveLoggedIn(true);
        AppManager.instance.loginResponseData = response;
        Navigator.pushReplacementNamed(context, homeScreen);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }

  void onSignInPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      loginBloc.login();
    } else {
      loginBloc.errorSubject.add(AppLocalizations.of(context)!.userLoginFailed);
    }
  }
}
