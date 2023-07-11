import 'dart:convert';

import 'package:phorms/config/ecodes.dart';
import 'package:phorms/core/extensions/network_client_extensions.dart';
import 'package:phorms/core/network_client/network_client.dart';
import 'package:phorms/features/auth/domain/entities/auth.dart';

abstract class IAuthenticationApi {
  Future<Auth> signIn(String email, String password);
  Future<ECode> signUp(String email, String password);
  Future<void> signOut();
  Future<Auth> signInWithToken(String token);
}

class AuthenticationApi implements IAuthenticationApi {
  AuthenticationApi(this._networkClient);

  final NetworkClient _networkClient;

  @override
  Future<Auth> signIn(String email, String password) async {
    final response = await _networkClient.post(
      '/login',
      data: jsonEncode(
        {'email': email, 'password': password},
      ),
    );

    final sr = response.toServerResponse();

    if ((sr.data as Map<String, Object?>?) != null) {
      return Auth.signedIn(
          token: (sr.data as Map<String, Object?>)['token'].toString());
    } else {
      return const Auth.signedOut();
    }
  }

  @override
  Future<void> signOut() async {
    return;
  }

  @override
  Future<ECode> signUp(String email, String password) async {
    final res = await _networkClient.post('/signup',
        data: jsonEncode({'email': email, 'password': password}));

    final rs = res.toServerResponse();
    return rs.code;
  }

  @override
  Future<Auth> signInWithToken(String token) async {
    final response = await _networkClient
        .post('/loginToken', headers: {'Authorization': token});

    final sr = response.toServerResponse();

    if ((sr.data as Map<String, Object?>?) != null) {
      return Auth.signedIn(
          token: (sr.data as Map<String, Object?>)['token'].toString());
    } else {
      return const Auth.signedOut();
    }
  }
}
