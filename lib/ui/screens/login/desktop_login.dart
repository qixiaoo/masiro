import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/chrome.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/misc/url.dart';
import 'package:puppeteer/plugins/stealth.dart';
import 'package:puppeteer/puppeteer.dart';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});

  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  final _logger = getIt<Logger>();

  String? chromePath;

  @override
  void initState() {
    super.initState();
    _prepareChromePath();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final loginTip = isDesktop ? localizations.desktopLoginTip : '';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (chromePath == null)
            Text(localizations.chromeNotFound)
          else ...[
            Text(loginTip),
            Text('${localizations.chromePath} $chromePath'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _desktopLogin(context),
              child: Text(localizations.login),
            ),
          ],
        ],
      ),
    );
  }

  void _prepareChromePath() async {
    final path = await findChrome();
    setState(() {
      chromePath = path;
    });
  }

  Future<void> _desktopLogin(BuildContext context) async {
    if (chromePath == null) {
      return;
    }

    _logger.d('Opening browser `$chromePath`...');
    final browser = await puppeteer.launch(
      headless: false,
      executablePath: chromePath,
      plugins: [StealthPlugin()],
      args: ['--disable-blink-features=AutomationControlled'],
    );

    final page = await browser.newPage();
    await page.goto(
      MasiroUrl.loginUrl,
      wait: Until.networkIdle,
    );

    // Wait until login is successful
    await page.onResponse.firstWhere(
      (resp) => resp.url == '${MasiroUrl.baseUrl}${MasiroUrl.recentUpdates}',
    );

    // Save cookies to cookieJar
    final result = await page.devTools.client.send('Storage.getCookies', {});
    final cookieObjets = result['cookies'] as List<Map<String, dynamic>>;
    final cookies = cookieObjets.map(fromCookieObject).toList();
    final cookieJar = await getCookieJar();
    await cookieJar.saveFromResponse(Uri.parse(MasiroUrl.baseUrl), cookies);

    _logger.d('Closing browser...');
    await browser.close();
    if (context.mounted) {
      GoRouter.of(context).go(RoutePath.favorites);
    }
  }
}
