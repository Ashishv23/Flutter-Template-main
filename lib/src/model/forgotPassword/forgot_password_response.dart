class ForgotPasswordResponse {
  ForgotPasswordResponse({
    this.errorDetail,
    this.entityCode,
    this.eventCode,
    this.eventMessageId,
  });

  String? errorDetail;
  int? entityCode;
  int? eventCode;
  String? eventMessageId;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        errorDetail: json['errorDetail'],
        entityCode: json['entityCode'],
        eventCode: json['eventCode'],
        eventMessageId: json['eventMessageId'],
      );

  Map<String, dynamic> toJson() => {
        'errorDetail': errorDetail,
        'entityCode': entityCode,
        'eventCode': eventCode,
        'eventMessageId': eventMessageId,
      };
}
