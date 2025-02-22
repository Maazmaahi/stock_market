part of '../core.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesName.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RoutesName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutesName.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RoutesName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutesName.stockDetail,
        builder: (context, state)  {
          final Stock stock = state.extra! as Stock;
          return StockDetailScreen(stock: stock,);
          },
      ),
    ],
  );
}
