import 'package:dio/dio.dart';
import 'package:kuncie_musicplayer/api/api_interceptor.dart';

class Api {

  final itunesApi = createItunesApi();

  static Dio createItunesApi() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://itunes.apple.com',
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.addAll({
      ApiInterceptors(dio),
    });
    return dio;
  } 

}