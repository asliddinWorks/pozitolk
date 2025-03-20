
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pozitolk/pages/login/data/login_repo/login_repo.dart';

var getIt = GetIt.instance;

final header = {
  'Accept' : 'application/json',
  'Content-Type' : 'application/json',
};

Map<String, dynamic> headerWithAuth(String? token) => {
  'Accept' : 'application/json',
  'Content-Type' : 'application/json',
  "Authorization": "Bearer $token",
};

Future<void> init() async {
  /// Hive
  await initHive();
  /// Get_it
  getItInit();
  /// Local database init
  // await GetStorage.init();
}

void getItInit() async {

  getIt
    ..registerLazySingleton(
          () => Dio()
        ..options = BaseOptions(
          baseUrl: 'https://backend.xn--g1acgdmcd1a.xn--p1ai/',
          headers: header,
          sendTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
        ..interceptors.addAll(
          [
            LogInterceptor(
              requestBody: kDebugMode,
              responseBody: kDebugMode,
              logPrint: (object) =>
              kDebugMode ? log('dio: ${object.toString()}') : null,
            ),
            // chuck.getDioInterceptor(),
          ],
        ),
    )

  /// Repository
    ..registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(getIt()));
    // ..registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()))
    // ..registerLazySingleton<AddCarRepo>(() => AddCarRepoImpl(getIt()))
    // ..registerLazySingleton<GasRepo>(() => GasRepoImpl(getIt()))
    // ..registerLazySingleton<ServiceRepo>(() => ServiceRepoImpl(getIt()))
    // ..registerLazySingleton<AnalyticalRepo>(() => AnalyticalRepoImpl(getIt()))
    // ..registerLazySingleton<TripsRepo>(() => TripsRepoImpl(getIt()));

}

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("appBox");
}
