import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phorms/config/ecodes.dart';
import 'package:phorms/core/presentation/components/ecode_snackbar.dart';
import 'package:phorms/features/auth/domain/entities/auth.dart';
import 'package:phorms/features/auth/providers.dart';
import 'package:phorms/features/auth/usecases/auth_usecases_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final IAuthUsecases _authUsecases;

  late SharedPreferences _sharedPreferences;
  static const _sharedPrefsKey = 'token';

  AsyncValue<Auth> get value => super.state;

  String? email;
  String? password;

  void onEmailChanged(String value) => email = value;
  void onPasswordChanged(String value) => password = value;

  void clearFields() {
    email = null;
    password = null;
  }

  @override
  Future<Auth> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _authUsecases = ref.read(authUsecasesProvider);
    _persistenceRefreshLogic();

    return _loginRecoveryAttempt();
  }

  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final savedToken = _sharedPreferences.getString(_sharedPrefsKey);
      if (savedToken == null) {
        throw const UnauthorizedException('No Auth Token Found');
      }

      return await _loginWithToken(savedToken);
    } catch (_, __) {
      await _sharedPreferences.remove(_sharedPrefsKey);
      return const Auth.signedOut();
    }
  }

  Future<Auth> _loginWithToken(String token) async {
    return _authUsecases.signInWithToken(token);
  }

  Future<void> login() async {
    state = await AsyncValue.guard<Auth>(() async {
      return _authUsecases.signIn(email ?? '', password ?? '');
    });
  }

  Future<void> register(BuildContext context) async {
    final sMS = ScaffoldMessenger.of(context);
    _authUsecases.signUp(email ?? '', password ?? '').then((eCode) {
      sMS.clearSnackBars();
      if (eCode == ECode.NO_ERROR) {
        sMS.showSnackBar(
            const SnackBar(content: Text('Successfully registered!')));
      } else {
        sMS.showSnackBar(PhromsErrorSnackbar.fromECode(eCode).snackBar);
      }
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue<Auth>.data(Auth.signedOut());
  }

  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_sharedPrefsKey);

        return;
      }

      next.requireValue.map<void>(
          signedIn: (signedIn) =>
              _sharedPreferences.setString(_sharedPrefsKey, signedIn.token),
          signedOut: (_) => _sharedPreferences.remove(_sharedPrefsKey));
    });
  }
}

class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}
