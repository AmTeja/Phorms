import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phorms/config/router/routes.dart';
import 'package:phorms/core/extensions/context_extensions.dart';
import 'package:phorms/core/extensions/text_style_extensions.dart';
import 'package:phorms/features/auth/presentation/state/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.cs.background,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                        alignment: Alignment.center,
                        child: Text('Phorms',
                            style: context.textTheme.displaySmall)),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Consumer(builder: (context, ref, _) {
                        final notifier =
                            ref.watch(authControllerProvider.notifier);
                        return TextField(
                          onChanged: (value) => notifier.onEmailChanged(value),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                      Consumer(builder: (context, ref, _) {
                        final notifier =
                            ref.watch(authControllerProvider.notifier);
                        return TextField(
                          onChanged: (value) =>
                              notifier.onPasswordChanged(value),
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        );
                      }),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Consumer(builder: (context, ref, _) {
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .clearFields();
                                RegisterRoute().go(context);
                              },
                              child: Text('No account yet? Register here',
                                  style: context.textTheme.labelLarge
                                      .c(context.cs.onSurface)),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const _LoginButton()
                    ],
                  ))
            ],
          ),
        ));
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(authControllerProvider.notifier);
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            padding: const EdgeInsets.all(8),
          ),
          onPressed: notifier.value.isLoading ? null : () => notifier.login(),
          child: notifier.value.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  "Login",
                  style: context.textTheme.bodyLarge.c(context.cs.onSurface),
                ),
        );
      },
    );
  }
}
