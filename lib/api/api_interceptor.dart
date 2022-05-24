import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;

  ApiInterceptors(this.dio);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} ${jsonEncode(response.data)}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} ${err.message}');
    return super.onError(err, handler);
  }
}