import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../providers/provider/auth_provider.dart';
import 'widgets/animated_stock_graph.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _preloadData();
  }

  void _preloadData() async {
    final authState = ref.read(authProvider); // Read the auth state
    await Future.delayed(const Duration(seconds: 2));
    authState.when(
      data: (user) {
        if (user != null) {
          context.go(RoutesName.home); // User is logged in
        } else {
          context.go(RoutesName.login); // User is not logged in
        }
      },
      loading: () {
        // Handle loading state (e.g., show a loading indicator)
      },
      error: (error, stackTrace) {
        context.go(RoutesName.login); // If error, go to login.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedStockGraph(),
            const SizedBox(height: 20),
            Text(
              "Stock Market App",
              style: p24.copyWith(color: colorScheme.primary).bold,
            ),
          ],
        ),
      ),
    );
  }
}
