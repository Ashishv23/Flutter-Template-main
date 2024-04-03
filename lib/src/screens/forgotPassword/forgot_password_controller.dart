import 'package:flutter/material.dart';
import 'package:flutter_template/src/bloc/forgot_password_bloc.dart';
import 'package:flutter_template/src/index.dart';
import 'package:flutter_template/src/screens/forgotPassword/forgot_password_screen.dart';

class ForgotPasswordViewController extends StatefulWidget {
  const ForgotPasswordViewController({Key? key}) : super(key: key);

  @override
  ForgotPasswordControllerState createState() =>
      ForgotPasswordControllerState();
}

class ForgotPasswordControllerState
    extends State<ForgotPasswordViewController> {
  final ForgotPasswordBloc forgotPasswordBloc = ForgotPasswordBloc();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ForgotPasswordView(this);
  }

  void onSendEmailPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      forgotPasswordBloc.getForgotPasswordCode();
    } else {
      forgotPasswordBloc.errorSubject
          .add(AppLocalizations.of(context)!.email_is_required);
    }
  }
}
