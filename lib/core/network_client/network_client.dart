//networkclient using dio

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static final NetworkClient _singleton = NetworkClient._internal();
  factory NetworkClient() {
    return _singleton;
  }
  NetworkClient._internal();

  final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ))
    ..options.baseUrl = baseUrl
    ..options.validateStatus = (status) => status! >= 200;

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(
    String url, {
    Object? data,
    Map<String, Object>? headers,
  }) async {
    return await _dio.post(url, data: data, options: Options(headers: headers));
  }

  Future<Response> put(String url, Object? data) async {
    return await _dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await _dio.delete(url);
  }
}
