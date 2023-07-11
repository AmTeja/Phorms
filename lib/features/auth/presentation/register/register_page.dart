import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phorms/config/router/routes.dart';
import 'package:phorms/core/extensions/context_extensions.dart';
import 'package:phorms/core/extensions/text_style_extensions.dart';
import 'package:phorms/features/auth/presentation/state/auth_controller.dart';
import 'package:phorms/features/auth/presentation/util/validators.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Consumer(builder: (context, ref, _) {
                          final notifier =
                              ref.watch(authControllerProvider.notifier);
                          return TextFormField(
                            onChanged: (value) =>
                                notifier.onEmailChanged(value),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
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
                          return TextFormField(
                            onChanged: (value) => {
                              _formKey.currentState!.validate,
                              notifier.onPasswordChanged(value),
                            },
                            obscureText: true,
                            validator: validatePassword,
                            keyboardType: TextInputType.visiblePassword,
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
                                  LoginRoute().go(context);
                                },
                                child: Text(
                                    'Already have an account? Login here',
                                    style: context.textTheme.labelLarge
                                        .c(context.cs.onSurface)),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _RegisterButton(_formKey)
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton(this._formKey);

  final GlobalKey<FormState> _formKey;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final controller = ref.watch(authControllerProvider.notifier);
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            padding: const EdgeInsets.all(8),
          ),
          onPressed: controller.value.isLoading
              ? null
              : () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    controller.register(context);
                  }
                },
          child: controller.value.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  "Register",
                  style: context.textTheme.bodyLarge.c(context.cs.onSurface),
                ),
        );
      },
    );
  }
}
