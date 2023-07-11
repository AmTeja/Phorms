import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phorms/core/network_client/providers.dart';
import 'package:phorms/features/auth/data/datasource/auth_api.dart';
import 'package:phorms/features/auth/data/repository/auth_repository.dart';
import 'package:phorms/features/auth/domain/repository/auth_repository.dart';
import 'package:phorms/features/auth/usecases/auth_usecases.dart';
import 'package:phorms/features/auth/usecases/auth_usecases_interface.dart';

final _authApiProvider = Provider<IAuthenticationApi>((ref) {
  return AuthenticationApi(ref.read(networkClientProvider));
});

final _authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref.read(_authApiProvider));
});

final authUsecasesProvider = Provider<IAuthUsecases>((ref) {
  return AuthUsecases(ref.read(_authRepositoryProvider));
});
