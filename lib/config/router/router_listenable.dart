import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phorms/config/router/routes.dart';
import 'package:phorms/features/auth/presentation/state/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuth = false;

  @override
  Future<void> build() async {
    _isAuth = await ref.watch(
      authControllerProvider.selectAsync(
        (data) => data.map(signedIn: (_) => true, signedOut: (_) => false),
      ),
    );

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    if (this.state.isLoading || this.state.hasError) return null;

    final isSplash = state.location == SplashRoute.path;

    if (isSplash) {
      await Future.delayed(const Duration(seconds: 1));
      return _isAuth ? HomeRoute.path : LoginRoute.path;
    }

    final isRegistering = state.location == RegisterRoute.path;
    if (isRegistering) return _isAuth ? HomeRoute.path : null;

    final isLoggingIn = state.location == LoginRoute.path;
    if (isLoggingIn) return _isAuth ? HomeRoute.path : null;

    return _isAuth ? null : SplashRoute.path;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
