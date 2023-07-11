import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phorms/features/auth/presentation/login/login_page.dart';
import 'package:phorms/features/auth/presentation/register/register_page.dart';
import 'package:phorms/features/splash/presentation/splash_page.dart';
import 'package:phorms/main.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const path = '/splash';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    //animate transition
    if (state.location == SplashRoute.path) {
      return MaterialPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
        name: state.location,
      );
    }
    return super.buildPage(context, state);
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyHomePage(
      title: 'Phorms',
    );
  }
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends GoRouteData {
  const LoginRoute();
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage();
  }
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();
  static const path = '/register';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterPage();
  }
}
