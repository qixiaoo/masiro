import 'package:shared_preferences/shared_preferences.dart';

// Keys
const _versionKey = 'version';
const _languageKey = 'language';

// Represents the current version of the shared preferences data
const _currentVersion = 10;

/// Manages all the shared preferences data used by the application
class PreferencesRepository {
  static bool _initialized = false;
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    if (_initialized) {
      return;
    }

    _initialized = true;
    _prefs = await SharedPreferences.getInstance();

    // Save current version
    await _prefs.setInt(_versionKey, _currentVersion);
  }

  PreferencesRepository();

  String get language => _prefs.getString(_languageKey) ?? 'zh';

  set language(String value) => _prefs.setString(_languageKey, value);
}
