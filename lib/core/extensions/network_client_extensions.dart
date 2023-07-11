import 'package:dio/dio.dart';
import 'package:phorms/core/network_client/server_response.dart';

extension ResponseExtensions on Response {
  ServerResponse toServerResponse() {
    return ServerResponse.fromJson(data as Map<String, Object?>);
  }
}
