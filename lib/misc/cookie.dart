import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:masiro/misc/url.dart';
import 'package:path_provider/path_provider.dart';

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

Future<PersistCookieJar> _cookieJar = getApplicationSupportDirectory().then(
  (supportDir) => PersistCookieJar(storage: FileStorage(supportDir.path)),
);

/// Returns the default cooke jar
Future<PersistCookieJar> getCookieJar() async {
  return _cookieJar;
}

/// Returns local persisted cookies
Future<List<Cookie>> getCookies() async {
  final cookieJar = await getCookieJar();
  return cookieJar.loadForRequest(Uri.parse(MasiroUrl.baseUrl));
}

/// Deletes all local persisted cookies
Future<void> deleteAllCookies() async {
  final cookieJar = await getCookieJar();
  return cookieJar.deleteAll();
}
