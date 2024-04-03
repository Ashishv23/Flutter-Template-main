import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_template/src/screens/login/login_controller.dart';
import '../../index.dart';

class LoginView extends StatelessWidget {
  final LoginController controller;
  const LoginView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCS(
      keys: controller.scaffoldKey,
      isSafeAreaRequired: false,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [bluePurple, vividViolet, cadillac],
              ),
            ),
          ),
          Form(
            key: controller.formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          ImagePath.logo,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: <Widget>[
                          CustomTextField(
                            label: AppLocalizations.of(context)!.email,
                            controller: controller.loginBloc.emailController,
                            keyboardType: TextInputType.emailAddress,
                            showPasswordToggleIcon: false,
                            onSubmitted: (value) {
                              if (controller.formKey.currentState!.validate()) {
                                // ignore: avoid_single_cascade_in_expression_statements
                                controller.formKey..currentState!.save();
                                controller.onSignInPressed();
                              }
                            },
                            validator: (value) {
                              var result = controller.loginBloc.validator
                                  .validateEmail(value ?? '');
                              if (result != '') {
                                return result;
                              }
                              return null;
                            },
                          ),
                          verticalSizedBox16,
                          CustomTextField(
                            label: AppLocalizations.of(context)!.key_password,
                            controller: controller.loginBloc.passwordController,
                            onSubmitted: (value) {
                              if (controller.formKey.currentState!.validate()) {
                                controller.formKey.currentState!.save();
                                controller.onSignInPressed();
                              }
                            },
                            validator: (value) {
                              if ((value ?? '').isEmpty || value == '') {
                                return AppLocalizations.of(context)!
                                    .password_is_required;
                              }
                              return null;
                            },
                            showPasswordToggleIcon: true,
                          ),
                          verticalSizedBox24,
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: CustomRaisedButton(
                              borderRadius: 5,
                              buttonColor: white,
                              text: AppLocalizations.of(context)!
                                  .login_button_title,
                              onCustomButtonPressed: () {
                                controller.onSignInPressed();
                              },
                              textColor: bluePurple,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.restorablePushNamed(
                                context,
                                forgotPasswordScreen,
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.forgot_password,
                              style:
                                  const TextStyle(color: white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
