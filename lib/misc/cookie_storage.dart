import 'package:cookie_jar/cookie_jar.dart';

typedef CookieWriter = Future<void> Function(String key, String? value);
typedef CookieReader = Future<String?> Function(String key);

class CookieStorage implements Storage {
  CookieWriter cookieWriter;
  CookieReader cookieReader;

  CookieStorage({
    required this.cookieWriter,
    required this.cookieReader,
  });

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<void> delete(String key) async {
    return cookieWriter(key, null);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    for (var i = 0; i < keys.length; i++) {
      await delete(keys[i]);
    }
  }

  @override
  Future<String?> read(String key) async {
    return cookieReader(key);
  }

  @override
  Future<void> write(String key, String value) async {
    return cookieWriter(key, value);
  }
}
