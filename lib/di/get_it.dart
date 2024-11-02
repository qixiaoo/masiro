import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_isar_store/dio_cache_interceptor_isar_store.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:masiro/data/database/core.dart';
import 'package:masiro/di/injectable.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/url.dart';
import 'package:path_provider/path_provider.dart';

// TODO(qixiao): Configurable user-agent header
const _userAgent =
    'Mozilla/5.0 (X11; Linux x86_64; rv:129.0) Gecko/20100101 Firefox/129.0';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register logger
  final logger = Logger();
  getIt.registerSingleton(logger);

  // Register dio
  final supportDir = await getApplicationSupportDirectory();
  final options = CacheOptions(
    store: IsarCacheStore(supportDir.path),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: const [401, 403],
  );
  final dio = Dio(BaseOptions(baseUrl: MasiroUrl.baseUrl))
    ..interceptors.add(DioCacheInterceptor(options: options))
    ..interceptors.add(LogInterceptor(responseBody: false))
    ..options.headers[HttpHeaders.userAgentHeader] = _userAgent
    ..options.followRedirects = false
    ..options.validateStatus =
        (status) => status != null && status >= 200 && status < 400;
  getIt.registerSingleton(dio);

  // Register isar
  final isar = await Isar.open(
    dbSchemas,
    directory: supportDir.path,
    inspector: true,
  );
  getIt.registerSingleton(isar);

  // Config injectable dependencies
  configureDependencies();

  // Config dio cookie manager
  await resetCookieManager();
}
