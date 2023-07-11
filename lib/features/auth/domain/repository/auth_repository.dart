import 'package:phorms/config/ecodes.dart';
import 'package:phorms/features/auth/domain/entities/auth.dart';

abstract class IAuthRepository {
  Future<Auth> signIn(String email, String password);
  Future<Auth> signInWithToken(String token);
  Future<ECode> signUp(String email, String password);
  Future<void> signOut();
}
