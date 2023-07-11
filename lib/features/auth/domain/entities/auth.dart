import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth.signedIn({
    required String token,
  }) = SignedIn;

  const factory Auth.signedOut() = SignedOut;
}
