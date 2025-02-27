
part of 'router.dart';

sealed class RouteNames {
  static const splash = '/';
  static const home = '/home';

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
  ],
);
