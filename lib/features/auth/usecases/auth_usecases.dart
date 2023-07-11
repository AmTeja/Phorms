import 'package:phorms/config/ecodes.dart';
import 'package:phorms/features/auth/domain/entities/auth.dart';
import 'package:phorms/features/auth/domain/repository/auth_repository.dart';
import 'package:phorms/features/auth/usecases/auth_usecases_interface.dart';

class AuthUsecases implements IAuthUsecases {
  const AuthUsecases(this._repo);

  final IAuthRepository _repo;

  @override
  Future<Auth> signIn(String email, String password) {
    return _repo.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return _repo.signOut();
  }

  @override
  Future<ECode> signUp(String email, String password) {
    return _repo.signUp(email, password);
  }

  @override
  Future<Auth> signInWithToken(String token) {
    return _repo.signInWithToken(token);
  }
}
