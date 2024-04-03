class LoginRequest {
  String? email;
  String? password;
  int? clientType;
  String? deviceId;
  bool? rememberMe;
  int? offset;

  LoginRequest(
      {this.email,
      this.password,
      this.clientType,
      this.deviceId,
      this.rememberMe,
      this.offset});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    clientType = json['clientType'];
    deviceId = json['deviceId'];
    rememberMe = json['rememberMe'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['clientType'] = clientType;
    data['deviceId'] = deviceId;
    data['rememberMe'] = rememberMe;
    data['offset'] = offset;
    return data;
  }
}