import 'package:flutter_template/src/model/forgotPassword/forgot_password_code_response.dart';
import 'package:flutter_template/src/model/forgotPassword/forgot_password_request.dart';
import 'package:flutter_template/src/model/forgotPassword/forgot_password_response.dart';
import 'package:flutter_template/src/network/api_provider.dart';

class ForgotPasswordRepository {
  final baseApiProvider = ApiProvider();

  Future<ForgotPasswordCodeResponse> getForgotPasswordCode(
      {required String email}) async {
    final response = await baseApiProvider.call(
      url: '/api/v1/Account/mobile-forgot-password-code/$email',
      method: HTTPMethod.get,
    );
    return ForgotPasswordCodeResponse.fromJson(response);
  }

  Future<ForgotPasswordResponse> getForgotPassword(
      ForgotPasswordRequest request) async {
    final response = await baseApiProvider.call(
        url: '/api/v1/Account/mobile-forgot-password',
        method: HTTPMethod.post,
        request: request.toJson());
    return ForgotPasswordResponse.fromJson(response);
  }
}
