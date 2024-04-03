class LoginResponse {
  LoginResponseData? data;
  int? entityCode;
  int? eventCode;
  String? eventMessageId;

  LoginResponse(
      {this.data, this.entityCode, this.eventCode, this.eventMessageId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LoginResponseData.fromJson(json['data']) : null;
    entityCode = json['entityCode'];
    eventCode = json['eventCode'];
    eventMessageId = json['eventMessageId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['entityCode'] = entityCode;
    data['eventCode'] = eventCode;
    data['eventMessageId'] = eventMessageId;
    return data;
  }
}

class LoginResponseData {
  String? id;
  int? expiresIn;
  int? expiration;
  int? tenantId;
  int? propertyId;
  String? accessToken;
  String? refreshToken;

  LoginResponseData(
      {this.id,
      this.expiresIn,
      this.expiration,
      this.tenantId,
      this.propertyId,
      this.accessToken,
      this.refreshToken});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expiresIn = json['expires_in'];
    expiration = json['expiration'];
    tenantId = json['tenantId'];
    propertyId = json['propertyId'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['expires_in'] = expiresIn;
    data['expiration'] = expiration;
    data['tenantId'] = tenantId;
    data['propertyId'] = propertyId;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}