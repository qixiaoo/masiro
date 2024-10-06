import 'package:flutter/services.dart' show rootBundle;

Future<String?> getVersion() async {
  final contents = await rootBundle.loadString('pubspec.yaml');
  final lines = contents.split('\n');

  for (final line in lines) {
    if (line.startsWith('version:')) {
      final version = line.split(':')[1].trim();
      return version;
    }
  }

  return null;
}
