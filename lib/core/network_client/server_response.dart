import 'package:phorms/config/ecodes.dart';

class ServerResponse {
  final String message;
  final ECode code;
  final Object? data;

  ServerResponse({
    required this.message,
    required this.code,
    this.data,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      message: json['message'],
      code: ECode.values.firstWhere((e) => e.id == json['code']),
      data: json['data'],
    );
  }
}
