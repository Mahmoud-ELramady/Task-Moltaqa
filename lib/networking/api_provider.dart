import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'custom_exception.dart';

class ApiProvider {
// next three lines makes this class a Singleton
  static final ApiProvider _instance = ApiProvider.internal();
  ApiProvider.internal();
  factory ApiProvider() => _instance;

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {body, Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithDio(String url, {Map<String, String>? headers}) async {
    var responseJson;
    try {
      final response = await Dio().get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: headers,
        ),
      );
      responseJson = _dioResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithDio(String url,
      {body, Map<String, String?>? headers}) async {
    var responseJson;
    try {
      final response = await Dio().post(
        url,
        data: body,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.plain,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: headers,
        ),
      );
      responseJson = _dioResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return {'status': 200, 'response': responseJson};

      case 201:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return {'status': 201, 'response': responseJson};

      case 400:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return {'status': 400, 'response': responseJson};
      // throw BadRequestException(response.body.toString());

      case 401:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return {'status': 401, 'response': responseJson};

      case 422:
        var responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return {'status': 422, 'response': responseJson};

      case 403:
        throw UnauthorisedException(response.body.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _dioResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        print(responseJson);
        return {'status': 200, 'response': responseJson};
      case 201:
        var responseJson = response.data;
        print(responseJson);
        return {'status': 201, 'response': responseJson};

      case 400:
        var responseJson = jsonDecode(response.data);
        print(responseJson);
        return {'status': 400, 'response': responseJson};

      case 401:
        var responseJson = response.data;
        print(responseJson);
        return {'status': 401, 'response': responseJson};

      case 422:
        var responseJson = response.data;
        print(responseJson);
        return {'status': 422, 'response': responseJson};

      case 403:
        throw UnauthorisedException(response.data);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
