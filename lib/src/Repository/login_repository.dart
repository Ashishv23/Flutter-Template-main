import 'package:flutter_template/src/model/login/login/login_request.dart';
import 'package:flutter_template/src/model/login/login/login_response.dart';
import 'package:flutter_template/src/network/api_provider.dart';

class LoginRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
      url: '/api/v1/Auth/login',
      method: HTTPMethod.post, 
      request: request.toJson()
    );
    return LoginResponse.fromJson(response);
  }
}
