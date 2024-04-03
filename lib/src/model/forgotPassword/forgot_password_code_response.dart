class ForgotPasswordCodeResponse {
  ForgotPasswordCodeResponse({
    this.data,
    this.entityCode,
    this.eventCode,
    this.eventMessageId,
  });

  String? data;
  int? entityCode;
  int? eventCode;
  String? eventMessageId;

  factory ForgotPasswordCodeResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordCodeResponse(
        data: json['data'],
        entityCode: json['entityCode'],
        eventCode: json['eventCode'],
        eventMessageId: json['eventMessageId'],
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'entityCode': entityCode,
        'eventCode': eventCode,
        'eventMessageId': eventMessageId,
      };
}
