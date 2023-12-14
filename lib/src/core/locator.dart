import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/home/home_di.dart';
import 'interceptors/api_interceptor.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio Client
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: "https://crudcrud.com/",
      contentType: "application/json; charset=UTF-8",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  )..interceptors.addAll([ApiInterceptor()]));

  await homeDI();
}
