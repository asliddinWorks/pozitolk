import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/widget_extension.dart';
import '../../../router/router.dart';
import '../../core/data/data_source/local/app_local_data.dart';
import '../../core/data/data_source/remote/app_remote_data.dart';
import '../../core/widgets/app_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isConnected = true;
  bool isLoading = false;

  Future<bool> checkInternetConnection() async {
    bool result = await InternetConnection().hasInternetAccess;
    return result;
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    isLoading = true;
    setState(() {});
    if (await checkInternetConnection()) {
      await AppRemoteData.updateToken();
      AppLocalData.getUserToken.then(
        (value) {
          if (value == null) {
            context.go(RouteNames.login);
          } else {
            context.go(RouteNames.client);
          }
        },
      );
      isLoading = false;
      setState(() {});
    } else {
      isConnected = false;
      isLoading = false;
      setState(() {});
    }
    // await AppRemoteData.updateToken();
    // AppLocalData.getUserToken.then((value) {
    //   if (value == null) {
    //     context.go(AppRoute.splash2);
    //   } else {
    //     context.go(AppRoute.main);
    //   }
    // },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: isConnected
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Проверьте Интернет и повторите попытку.',
                      style: context.textStyle.s16w500Manrope,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppButton(
                      height: 50,
                      width: 100,
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        if (await checkInternetConnection()) {
                          isLoading = false;
                          setState(() {});
                          await AppRemoteData.updateToken();
                          AppLocalData.getUserToken.then(
                            (value) {
                              if (value == null) {
                                context.go(RouteNames.login);
                              } else {
                                context.go(RouteNames.consultation);
                              }
                            },
                          );
                        } else {
                          isLoading = false;
                          isConnected = false;
                          setState(() {});
                        }
                        isLoading = false;
                      },
                      text: 'Повторить',
                    ),
                  ],
                ),
        ),
      ),
    ).loadingView(isLoading);
  }
}
