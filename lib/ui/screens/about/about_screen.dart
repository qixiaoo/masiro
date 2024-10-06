import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/constant.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/pubspec.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/misc/toast.dart';
import 'package:masiro/misc/url.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? version;

  @override
  void initState() {
    super.initState();
    _initVersion();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(localizations.about),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Image(
              width: 200,
              height: 200,
              image: AssetImage('assets/icon/icon.png'),
            ),
          ),
          const Divider(),
          if (version != null)
            ListTile(
              leading: const Icon(Icons.numbers_rounded),
              title: Text(localizations.currentVersion),
              subtitle: Text(version!),
              onTap: () => _copy(context, version!),
            ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(localizations.projectHomepage),
            subtitle: const Text(projectHomepage),
            onTap: () => _copy(context, projectHomepage),
          ),
          ListTile(
            leading: const Icon(Icons.home_work_outlined),
            title: Text(localizations.websiteHomepage),
            subtitle: const Text(MasiroUrl.baseUrlWithoutSlash),
            onTap: () => _copy(context, MasiroUrl.baseUrlWithoutSlash),
          ),
          ListTile(
            leading: const Icon(Icons.code_rounded),
            title: Text(localizations.license),
            onTap: () => context.push(RoutePath.licenses),
          ),
        ],
      ),
    );
  }

  Future<void> _initVersion() async {
    final currVersion = await getVersion();
    setState(() => version = currVersion);
  }

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) {
      return;
    }
    context.localizations().copied.toast();
  }
}
