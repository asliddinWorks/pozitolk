import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitolk/pages/home/view_model/home_view_model.dart';
import 'package:pozitolk/router/router.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
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
