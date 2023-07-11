import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:phorms/config/router/router_listenable.dart';
import 'package:phorms/config/router/routes.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phorms/config/theme/colors.g.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(routerListenableProvider.notifier);
    final key = useRef(GlobalKey<NavigatorState>(debugLabel: 'routerKey'));

    final router = useMemoized(
      () => GoRouter(
        navigatorKey: key.value,
        refreshListenable: notifier,
        initialLocation: SplashRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: notifier.redirect,
      ),
      [notifier],
    );

    return MaterialApp.router(
      title: 'Phorms',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      routerConfig: router,
    );
  }
}
