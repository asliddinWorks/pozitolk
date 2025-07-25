import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitolk/di_service.dart';
import 'package:pozitolk/pages/consultation/view_model/chat_view_model.dart';
import 'package:pozitolk/pages/consultation/view_model/client_view_model.dart';
import 'package:pozitolk/pages/consultation/view_model/consultation_view_model.dart';
import 'package:pozitolk/pages/home/view_model/home_view_model.dart';
import 'package:pozitolk/pages/login/view_model/login_view_model.dart';
import 'package:pozitolk/router/router.dart';
import 'package:provider/provider.dart';
import 'core/theme/light_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  // initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => ConsultationViewModel(getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatViewModel(getIt()),
        ),
        ChangeNotifierProvider(
          create: (context) => ClientViewModel(getIt()),
        ),
      ],
      builder: (context, viewModel) => MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: lightTheme(context),
      ),
    );
  }
}
