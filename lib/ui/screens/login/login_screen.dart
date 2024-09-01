import 'package:flutter/material.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/login/desktop_login.dart';
import 'package:masiro/ui/screens/login/mobile_phone_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return isDesktop ? const DesktopLogin() : const MobilePhoneLogin();
  }
}
