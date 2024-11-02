import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:masiro/data/database/dao/user_dao.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/cookie_storage.dart';
import 'package:masiro/misc/url.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

/// Creates a `Cookie` from the [cookieObject]
Cookie fromCookieObject(Map<String, dynamic> cookieObject) {
  final cookie = Cookie(cookieObject['name'], cookieObject['value']);

  if (cookieObject.containsKey('expires')) {
    final ms = (cookieObject['expires'] as num).floor() * 1000;
    cookie.expires = DateTime.fromMillisecondsSinceEpoch(ms);
  }

  if (cookieObject.containsKey('domain')) {
    cookie.domain = cookieObject['domain'] as String;
  }

  if (cookieObject.containsKey('path')) {
    cookie.path = cookieObject['path'] as String;
  }

  cookie.secure = (cookieObject['secure'] as bool?) ?? false;

  cookie.httpOnly = (cookieObject['httpOnly'] as bool?) ?? false;

  if (cookieObject.containsKey('sameSite')) {
    final sameSite = cookieObject['sameSite'] as String;
    cookie.sameSite = switch (sameSite.toLowerCase()) {
      'lax' => SameSite.lax,
      'none' => SameSite.none,
      'strict' => SameSite.strict,
      _ => throw const HttpException(
          'SameSite value should be one of Lax, Strict or None.',
        )
    };
  }

  return cookie;
}

PersistCookieJar? _cookieJar;

/// Returns the default cooke jar.
/// This function should be called after `get_it` has been initialized.
Future<PersistCookieJar> getCookieJar({bool forceNewInstance = false}) async {
  if (forceNewInstance) {
    _cookieJar = PersistCookieJar(
      storage: CookieStorage(
        cookieWriter: getIt<UserDao>().putCurrentUserCookie,
        cookieReader: getIt<UserDao>().getCurrentUserCookie,
      ),
    );
    return _cookieJar!;
  }

  if (_cookieJar != null) {
    return _cookieJar!;
  }

  _cookieJar = PersistCookieJar(
    storage: CookieStorage(
      cookieWriter: getIt<UserDao>().putCurrentUserCookie,
      cookieReader: getIt<UserDao>().getCurrentUserCookie,
    ),
  );
  return _cookieJar!;
}

/// Returns local persisted cookies
Future<List<Cookie>> getCookies() async {
  final cookieJar = await getCookieJar();
  return cookieJar.loadForRequest(Uri.parse(MasiroUrl.baseUrl));
}

/// Deletes all instances of `CookieManager` from `dio.interceptors`,
/// and then adds a new `CookieManager` to `dio.interceptors`.
/// This function should be called after `get_it` has been initialized.
Future<void> resetCookieManager() async {
  final dio = getIt<Dio>();
  final cookieJar = await getCookieJar(forceNewInstance: true);
  final cookieManager = CookieManager(cookieJar);
  dio.interceptors.removeWhere((interceptor) => interceptor is CookieManager);
  dio.interceptors.add(cookieManager);
}

/// Deletes all webview cookies
Future<void> clearWebviewCookies() async {
  final cookieManager = WebviewCookieManager();
  return cookieManager.clearCookies();
}
