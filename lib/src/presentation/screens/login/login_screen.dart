import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends ConsumerWidget {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: textTheme.displaySmall?.bold.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Login to track and manage your stock investments.",
                style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
              ),
              const SizedBox(height: 60),
              AppTextFormField(
                controller: _identifierController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                controller: _passwordController,
                labelText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 60),
              authState.when(
                data: (userData) {
                  if (userData != null) {
                    // Navigate to the next screen if login is successful
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go(RoutesName.home);
                    });
                  }
                  return PrimaryButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).login(
                          _identifierController.text, _passwordController.text);
                    },
                    text: 'Login',
                    isFullWidth: true,
                  );
                },
                loading: () => const LoadingIndicator(),
                // Show loading indicator
                error: (error, stackTrace) => Column(
                  children: [
                    Text(error.toString(),
                        style: const TextStyle(color: Colors.red)),
                    PrimaryButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).login(
                            _identifierController.text,
                            _passwordController.text);
                      },
                      text: 'Retry',
                      isFullWidth: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up Option
              Center(
                child: TextButton(
                  onPressed: () => "",
                  child: const Text("Don't have an account? Sign up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
