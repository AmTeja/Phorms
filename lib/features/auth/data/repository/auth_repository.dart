import 'package:phorms/config/ecodes.dart';
import 'package:phorms/features/auth/data/datasource/auth_api.dart';
import 'package:phorms/features/auth/domain/entities/auth.dart';
import 'package:phorms/features/auth/domain/repository/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._authenticationApi);

  final IAuthenticationApi _authenticationApi;

  @override
  Future<Auth> signIn(String email, String password) async {
    return _authenticationApi.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return _authenticationApi.signOut();
  }

  @override
  Future<ECode> signUp(String email, String password) {
    return _authenticationApi.signUp(email, password);
  }

  @override
  Future<Auth> signInWithToken(String token) {
    return _authenticationApi.signInWithToken(token);
  }
}
