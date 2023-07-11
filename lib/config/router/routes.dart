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
class HomeRoute extends TransitionGoRoute {
  HomeRoute() : super(const MyHomePage(title: 'Phorms'));
  static const path = '/home';
}

@TypedGoRoute<LoginRoute>(path: LoginRoute.path)
class LoginRoute extends TransitionGoRoute {
  LoginRoute() : super(LoginPage());
  static const path = '/login';
}

@TypedGoRoute<RegisterRoute>(path: RegisterRoute.path)
class RegisterRoute extends TransitionGoRoute {
  RegisterRoute() : super(RegisterPage());
  static const path = '/register';
}

class TransitionGoRoute extends GoRouteData {
  const TransitionGoRoute(this.child, {this.toLeft = true});

  final Widget child;
  final bool toLeft;

  @override
  CustomTransitionPage<void> buildPage(
          BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, animation2, child) {
          final tween = Tween<Offset>(
            begin: toLeft ? const Offset(1, 0) : const Offset(-1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOutCubic));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
      );
}
