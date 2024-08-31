import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

extension StringToast on String {
  void toast() {
    SmartDialog.showToast(this);
  }
}
