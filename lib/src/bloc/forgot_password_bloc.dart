import 'package:flutter/material.dart';
import 'package:flutter_template/src/Repository/forgot_password_repository.dart';
import 'package:flutter_template/src/index.dart';
import 'package:flutter_template/src/model/forgotPassword/forgot_password_request.dart';
import 'package:flutter_template/src/model/forgotPassword/forgot_password_response.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordBloc extends BaseBloc {
  TextEditingController emailController = TextEditingController();
  Validator validator = Validator();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BehaviorSubject<ForgotPasswordResponse> forgotPasswordResponse =
      BehaviorSubject<ForgotPasswordResponse>();

  void getForgotPasswordCode() async {
    isLoading.add(true);

    try {
      var forgotPasswordRepository = ForgotPasswordRepository();
      var response = await forgotPasswordRepository.getForgotPasswordCode(
          email: emailController.text);
      isLoading.add(false);
      var request = ForgotPasswordRequest();
      request.code = response.data;
      getForgotPassword(request);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  void getForgotPassword(ForgotPasswordRequest request) async {
    isLoading.add(true);

    try {
      var forgotPasswordRepository = ForgotPasswordRepository();

      var response = await forgotPasswordRepository.getForgotPassword(request);
      isLoading.add(false);
      forgotPasswordResponse.add(response);
    } catch (e) {
      isLoading.add(false);
      errorSubject.add(e.toString());
    }
  }

  @override
  void dispose() {
    forgotPasswordResponse.close();
  }
}
