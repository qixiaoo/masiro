import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/misc/url.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

bool _initialized = false;

class MobilePhoneLogin extends StatefulWidget {
  const MobilePhoneLogin({super.key});

  @override
  State<MobilePhoneLogin> createState() => _MobilePhoneLoginState();
}

class _MobilePhoneLoginState extends State<MobilePhoneLogin> {
  late final WebViewController controller;

  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _initWebViewController();
    _showLoginTip();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.login),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_rounded),
            onPressed: () => _saveCookies(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              color: Colors.lightGreen,
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }

  void _initWebViewController() {
    final navigationDelegate = NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      },
      onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      },
      onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      },
    );
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(navigationDelegate)
      ..loadRequest(Uri.parse(MasiroUrl.loginUrl));
  }

  void _showLoginTip() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_initialized) {
        return;
      }
      _initialized = true;
      final localizations = context.localizations();
      SmartDialog.showToast(localizations.mobilePhoneLoginTip);
    });
  }

  void _saveCookies(BuildContext context) async {
    final cookieManager = WebviewCookieManager();
    final cookies =
        await cookieManager.getCookies(MasiroUrl.baseUrlWithoutSlash);
    final cookieJar = await getCookieJar();
    await cookieJar.saveFromResponse(Uri.parse(MasiroUrl.baseUrl), cookies);
    if (context.mounted) {
      GoRouter.of(context).go(RoutePath.favorites);
    }
  }
}
