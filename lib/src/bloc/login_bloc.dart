import 'package:flutter/material.dart';
import 'package:flutter_template/src/Repository/login_repository.dart';
import 'package:flutter_template/src/baseClass/base_bloc.dart';
import 'package:flutter_template/src/model/login/login/login_request.dart';
import 'package:flutter_template/src/model/login/login/login_response.dart';
import 'package:flutter_template/src/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validator validator = Validator();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BehaviorSubject<LoginResponse> loginResponse =
      BehaviorSubject<LoginResponse>();

  void login() async {
    isLoading.add(true);

    try {
      var loginRepository = LoginRepository();

      var request = LoginRequest();
      request.rememberMe = true;
      request.clientType = 0;
      request.deviceId = DateTime.now().millisecondsSinceEpoch.toString();
      request.email = emailController.text;
      request.password = passwordController.text;
      request.offset = DateTime.now().timeZoneOffset.inMinutes;

      var response = await loginRepository.login(request);
      isLoading.add(false);
      loginResponse.add(response);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  @override
  void dispose() {
    loginResponse.close();
  }
}
