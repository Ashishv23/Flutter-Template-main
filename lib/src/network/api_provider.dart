import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum HTTPMethod { get, post, put, delete }

class ApiProvider {
  bool kReleaseMode =
      const bool.fromEnvironment('dart.vm.product', defaultValue: false);
  String _baseUrlHttps = 'https://pmsapi.confidosoftsolutions.com';
  final String token = '';

  Future<BaseOptions> getOptions(HTTPMethod httpMethod) async {
    var method = 'GET';
    if (httpMethod == HTTPMethod.get) {
      method = 'GET';
    } else if (httpMethod == HTTPMethod.post) {
      method = 'POST';
    } else if (httpMethod == HTTPMethod.put) {
      method = 'PUT';
    } else if (httpMethod == HTTPMethod.delete) {
      method = 'DELETE';
    }
    if (kReleaseMode) {
      _baseUrlHttps = 'https://innrlyapi.confidosoftsolutions.com';
    }
    if (token.isEmpty) {
      return BaseOptions(
        method: method,
        baseUrl: _baseUrlHttps,
        contentType: 'application/json',
      );
    } else {
      return BaseOptions(
        method: method,
        baseUrl: _baseUrlHttps,
        contentType: 'application/json',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
    }
  }

  Future<dynamic> call(
      {String? url,
      required HTTPMethod method,
      Map<String, dynamic>? request}) async {
    dynamic responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);

    var encoder = const JsonEncoder.withIndent('  ');
    var prettyJson = encoder.convert(request);
    log('Request of $_baseUrlHttps$url : Request Data: $prettyJson');
    log(jsonEncode(request));

    try {
      final response = await dio.request(url!, data: request);
      debugPrint('${response.data.toString()}');
      responseJson = response.data;
      var prettyResponse = encoder.convert(responseJson);
      log('Request of $_baseUrlHttps$url : Request Data: $prettyJson : $prettyResponse');
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        debugPrint('DioErrorType Connect Timeout');
        debugPrint(e.response?.data);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.inspect(object)
        debugPrint('DioErrorType Received Timeout');
        debugPrint(e.response?.data);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        debugPrint('DioErrorType Response');
        // debugPrint(e.response?.data);
        if (e.response?.statusCode == 400) {
          var encoder = const JsonEncoder.withIndent('  ');
          var prettyJsonResponse = encoder.convert(e.response?.data);
          log('Error 400 of $_baseUrlHttps$url : Request Data: $prettyJson :$prettyJsonResponse');
          debugPrint(e.message);
          throw BadRequestException(e.response?.data['eventMessageId']);
        }
        throw BadRequestException(e.response?.data['eventMessageId']);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        debugPrint('DioErrorType Cancel');
        debugPrint(e.response?.data);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        debugPrint('DioErrorType Default');
        debugPrint('${e.response}');
        debugPrint(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }
    return responseJson;
  }

  ///Upload method using Dio
  Future<dynamic> uploadDocument(
      {String? url, FormData? formData, required HTTPMethod method}) async {
    var responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);

    try {
      var response = await dio.request(url!, data: formData,
          onSendProgress: (int sent, int total) {
        print('$sent $total');
      });
      print(response.data);
      var encoder = JsonEncoder.withIndent('  ');
      var prettyResponse = encoder.convert(response.data);
      log('Request of $_baseUrlHttps$url : $prettyResponse');
      responseJson = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType Connect Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.
        print('DioErrorType Received Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print('DioErrorType Response');
        print(e.response?.data);
        print(e.response?.headers);

        var encoder = JsonEncoder.withIndent('  ');
        var prettyrequest = encoder.convert(e.response?.data);
        log('Error 400 of $url : $prettyrequest');

        throw BadRequestException(e.response?.data['eventMessageId']);
        // throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        print('DioErrorType Cancel');
        print(e.response?.data);
        print(e.response?.headers);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print('DioErrorType Default');
        print(e.response);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }

    return responseJson;
  }

  Future<dynamic> download(
      {String? url, String? savePath, required HTTPMethod method}) async {
    var responseJson;

    var options = await getOptions(method);
    var dio = Dio(options);

    try {
      var response =
          await dio.download(url!, savePath, onReceiveProgress: (count, total) {
        print('$count $total');
      });
      print(response.data);
      responseJson = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print('DioErrorType Connect Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.receiveTimeout) {
        ///It occurs when receiving timeout.
        print('DioErrorType Received Timeout');
        print(e.response?.data);
        print(e.response?.headers);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.response) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print('DioErrorType Response');
        print(e.response?.data);
        print(e.response?.headers);
        throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.cancel) {
        /// When the request is cancelled, dio will throw a error with this type.
        print('DioErrorType Cancel');
        print(e.response?.data);
        print(e.response?.headers);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print('DioErrorType Default');
        print(e.response);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }

    return responseJson;
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class DefaultException extends CustomException {
  DefaultException(id) : super(id);
}

class CancelException extends CustomException {
  CancelException(id) : super(id);
}

class BadRequestException extends CustomException {
  BadRequestException([id]) : super(id, '');
}

class ConnectionTimeoutException extends CustomException {
  ConnectionTimeoutException([id]) : super(id, '');
}

class ReceiveTimeoutException extends CustomException {
  ReceiveTimeoutException([id]) : super(id, '');
}
