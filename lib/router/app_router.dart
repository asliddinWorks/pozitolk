
part of 'router.dart';

sealed class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const consultation = '/consultation';

}

GoRouter router = GoRouter(
  // initialLocation: initialLocation ?? '/',
  initialLocation: '/home',
  routes: [
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return NavigationBarPage(child: child);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: RouteNames.main,
    //       builder: (context, state) {
    //         return const MainPage();
    //       },
    //     ),
    //     GoRoute(
    //       path: RouteNames.stylist,
    //       builder: (context, state) {
    //         return const StylistPage();
    //       },
    //     ),
    //   ],
    // ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: RouteNames.consultation,
      builder: (context, state) {
        return const ConsultationPage();
      },
    ),
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
  ],
);
