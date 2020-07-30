import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void setOrientation(Orientation orientation) {
  // Restrict device orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();

  if (orientation == Orientation.portrait) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else if (orientation == Orientation.landscape) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
