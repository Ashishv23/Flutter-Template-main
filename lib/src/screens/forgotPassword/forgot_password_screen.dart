import 'package:flutter/material.dart';
import 'package:flutter_template/src/baseClass/app_bar.dart';
import 'package:flutter_template/src/screens/forgotPassword/forgot_password_controller.dart';
import '../../index.dart';

class ForgotPasswordView extends StatelessWidget {
  final ForgotPasswordControllerState controller;
  const ForgotPasswordView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCS(
      keys: controller.scaffoldKey,
      csAppBar: AppBars(
        scaffoldKey: controller.scaffoldKey,
        context: context,
        leftAppBarButton: LeftAppBarButton.back,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [bluePurple, vividViolet, cadillac],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
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
                    CustomTextField(
                      label: AppLocalizations.of(context)!.email,
                      controller: controller.forgotPasswordBloc.emailController,
                      onSubmitted: (value) {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.onSendEmailPressed();
                        }
                      },
                      validator: (value) {
                        var result = controller.forgotPasswordBloc.validator
                            .validateEmail(value ?? '');
                        if (result != '') {
                          return result;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      showPasswordToggleIcon: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomRaisedButton(
                        borderRadius: 5,
                        buttonColor: white,
                        text: AppLocalizations.of(context)?.continue_key,
                        onCustomButtonPressed: () {
                          controller.onSendEmailPressed();
                        },
                        textColor: bluePurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class ForgotPasswordScreen extends BaseView {
//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends BaseViewState<ForgotPasswordScreen>
//     with BasePage {
//   final ForgotPasswordBloc _forgotPasswordBloc = ForgotPasswordBloc();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void initBaseState() {
//     titleScreen = 'reset_your_password';
//     rightAppBarButton = RightAppBarButton.empty;
//     leftAppBarButton = LeftAppBarButton.back;

//     _forgotPasswordBloc.errorSubject.listen((error) {
//       showErrorMessage(error, scaffoldKey.currentState!);
//     });

//     _forgotPasswordBloc.isLoading.listen((value) {
//       if (value) {
//         showIndicator('Loading...', scaffoldKey.currentState!);
//       } else {
//         hideIndicator(scaffoldKey.currentState!);
//       }
//     });

//     _forgotPasswordBloc.forgotPasswordResponse.listen((response) {
//       Navigator.pushReplacementNamed(context, loginScreen);
//     });
//   }

//   @override
//   Widget body() {
//     final _localizations = AppLocalizations.of(context);

//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [bluePurple, vividViolet, cadillac],
//             ),
//           ),
//         ),
//         Center(
//           child: SingleChildScrollView(
//             child: Container(
//               margin: const EdgeInsets.all(15),
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       color: Colors.transparent,
//                     ),
//                     child: Image.asset(
//                       ImagePath.logo,
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   CustomTextField(
//                     label: AppLocalizations.of(context)!.email,
//                     controller: _forgotPasswordBloc.emailController,
//                     onSubmitted: (value) {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         _onSendEmailPressed();
//                       }
//                     },
//                     validator: (value) {
//                       var result = _forgotPasswordBloc.validator
//                           .validateEmail(value ?? '');
//                       if (result != '') {
//                         return result;
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     showPasswordToggleIcon: false,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: CustomRaisedButton(
//                       borderRadius: 5,
//                       buttonColor: white,
//                       text: AppLocalizations.of(context)!.continue_key,
//                       onCustomButtonPressed: () {
//                         _onSendEmailPressed();
//                       },
//                       textColor: bluePurple,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _onSendEmailPressed() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       _forgotPasswordBloc.getForgotPasswordCode();
//     }
//   }
// }
