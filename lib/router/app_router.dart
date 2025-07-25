
part of 'router.dart';

sealed class RouteNames {
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const consultation = '/consultation';
  static const messageUi = '/messageUi';
  static const new2 = '/new2';
  static const psychologistSettings = '/psychologistSettings';
  static const consultationChat = '/consultationChat';
  static const consultationHelp = '/consultationHelp';
  static const client = '/client';
  static const schedule = '/schedule';
  static const statistics = '/statistics';
  static const payment = '/payment';
  static const events = '/events';
  static const eventsItem = '/eventsItem';
  static const fullScreenVideoPage = '/fullScreenVideoPage';

}

GoRouter router = GoRouter(
  // initialLocation: initialLocation ?? '/',
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppBarCustom(child: child);
      },
      routes: [
        GoRoute(
          path: RouteNames.messageUi,
          builder: (context, state) {
            final ChatModel chatModel = state.extra as ChatModel;
            return  MessageUi(chatModel: chatModel,);
          },
        ),
        GoRoute(
          path: RouteNames.consultation,
          builder: (context, state) {
            return const ConsultationPage();
          },
        ),
        GoRoute(
          path: RouteNames.psychologistSettings,
          builder: (context, state) {
            return  const PsychologistSettingsUi();
          },
        ),
        GoRoute(
          path: RouteNames.consultationChat,
          builder: (context, state) {
            return  ConsultationChatUi();
          },
        ),
        GoRoute(
          path: RouteNames.consultationHelp,
          builder: (context, state) {
            return  ConsultationHelpUi();
          },
        ),
        GoRoute(
          path: RouteNames.client,
          builder: (context, state) {
            return  ClientPage();
          },
        ),
        GoRoute(
          path: RouteNames.schedule,
          builder: (context, state) {
            return  SchedulePage();
          },
        ),
        GoRoute(
          path: RouteNames.statistics,
          builder: (context, state) {
            return  StatisticsPage();
          },
        ),
        GoRoute(
          path: RouteNames.payment,
          builder: (context, state) {
            return  PaymentPage();
          },
        ),
        GoRoute(
          path: RouteNames.events,
          builder: (context, state) {
            return  EventsPage();
          },
        ),
        GoRoute(
          path: RouteNames.eventsItem,
          builder: (context, state) {
            final EventModel eventModel = state.extra as EventModel;
            return  EventItemPage(eventModel: eventModel);
          },
        ),
      ],
    ),
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
    // GoRoute(
    //   path: RouteNames.consultation,
    //   builder: (context, state) {
    //     return const ConsultationPage();
    //   },
    // ),
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: RouteNames.fullScreenVideoPage,
      builder: (context, state) {
        final String source = state.extra as String;
        return  FullScreenVideoPage(source: source);
      },
    ),
  ],
);
