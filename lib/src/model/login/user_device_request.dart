
class CSUserDeviceRequest {
  int? userId;
  String? deviceId;

  CSUserDeviceRequest({this.userId, this.deviceId});

  CSUserDeviceRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['deviceId'] = deviceId;
    return data;
  }
}
