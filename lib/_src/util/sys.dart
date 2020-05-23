import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';

class Sys {
  Sys._();
  static bool isIOS = Platform.isIOS;
  static bool isWeb = kIsWeb;
  static String locale = ui.window.locale.languageCode;
}