import 'package:daily_recipe/screens/auth/home_screen.dart';
import 'package:daily_recipe/screens/auth/login_screen.dart';
import 'package:flutter/widgets.dart';

/// `Routes` definition
var routes = <String, WidgetBuilder>{
  //'/': (context) => SplashView(),
  '/home': (context) => HomeScreen(),
  '/auth/login': (context) => LoginScreen(),
};
