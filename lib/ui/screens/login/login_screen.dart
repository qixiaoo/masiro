import 'package:flutter/material.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/login/desktop_login.dart';
import 'package:masiro/ui/screens/login/mobile_phone_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isDesktop ? const DesktopLogin() : const MobilePhoneLogin(),
    );
  }
}
