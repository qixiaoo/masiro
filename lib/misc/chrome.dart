import 'dart:io';

import 'package:flutter/foundation.dart';

Future<String?> findChrome() async {
  if (Platform.isWindows) {
    return findChromeOnWindows();
  } else if (Platform.isMacOS) {
    return findChromeOnMacOS();
  } else if (Platform.isLinux) {
    return findChromeOnLinux();
  }
  return null;
}

Future<String?> findChromeOnWindows() async {
  try {
    final result = await Process.run(
      'powershell',
      [
        '-NoProfile',
        '-Command',
        r'Get-ItemProperty -Path Registry::"HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" | Select-Object -ExpandProperty Path',
      ],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      final path = result.stdout.trim();
      if (path.isNotEmpty) {
        return path;
      }
    }
  } catch (e) {}

  return null;
}

Future<String?> findChromeOnMacOS() async {
  try {
    final result = await Process.run(
      'mdfind',
      ['kMDItemCFBundleIdentifier=="com.google.Chrome"'],
    );

    if (result.exitCode == 0) {
      final paths = result.stdout.trim().split('\n');
      if (paths.isNotEmpty) {
        return '${paths.first}/Contents/MacOS/Google Chrome';
      }
    }
  } catch (e) {}

  return null;
}

Future<String?> findChromeOnLinux() async {
  // Use `which` command to find `google-chrome` or `chromium`
  final chromePath = await findExecutablePath('google-chrome');
  if (chromePath != null) {
    return chromePath;
  }

  final chromiumPath = await findExecutablePath('chromium');
  if (chromiumPath != null) {
    return chromiumPath;
  }

  final chromiumBrowserPath = await findExecutablePath('chromium-browser');
  if (chromiumBrowserPath != null) {
    return chromiumBrowserPath;
  }

  return null;
}

Future<String?> findExecutablePath(String executableName) async {
  try {
    final result = await Process.run('which', [executableName]);
    if (result.exitCode == 0) {
      return result.stdout.trim();
    }
  } catch (e) {
    debugPrint('The `which` command is unavailable.');
  }
  return null;
}
