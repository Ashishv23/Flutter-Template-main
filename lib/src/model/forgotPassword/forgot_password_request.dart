class ForgotPasswordRequest {
  ForgotPasswordRequest({
    this.code,
  });

  String? code;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequest(
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
      };
}
