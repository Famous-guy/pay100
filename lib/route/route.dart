import 'package:flutter/material.dart';
import '../presentations/work.dart';
import '../presentations/splash_screen.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String WorkScreen = '/work_screen';


static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => Onboard(),
    WorkScreen: (context) => pay100(),
};

}