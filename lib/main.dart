import 'package:daily_recipe/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Recipe',
      theme: ThemeData(
        // Application theme
        primaryColor:  Color(0xFFF55A00),
        hintColor: Color(0xFFB2B7C6),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Hellix'
      ),
      // Includes routes file
      routes: routes,
      initialRoute: '/auth/login',
    );
  }
}
