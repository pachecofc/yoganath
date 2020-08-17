import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ColorConstants {
  static const Color kTabBarActiveColor = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color kTabBarInactiveColor = Color.fromRGBO(0, 0, 0, 0.5);
  static const Color kTransparentLighterGreen = Color(0x888EC397);
}

abstract class AuxProfileOptions {
  static const String kDrawerTitle = 'Configurações do Perfil';
  static const String kDrawerAccount = 'Conta';
  static const String kDrawerSubscription = 'Assinatura';
  static const String kDrawerSupport = 'Suporte';
  static const String kDrawerAbout = 'Conheça a Nath';
  static const String kDrawerAdmin = 'Administração do app';
}

abstract class AppInfo {
  static const String kAppName = 'YogaNath';
  static const String kAppVersion = '1.0.0';
  static const String kAppLegalese = '(c) 2020 AppLab';
  static final Image appIcon = Image.asset(
    'assets/images/logo.jpg',
    height: 24.0,
    width: 48.0,
  );
}
