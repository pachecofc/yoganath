import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void setOrientation(String orientation) {
  // Restrict device orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();

  if (orientation == 'portrait') {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
