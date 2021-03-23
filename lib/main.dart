import 'package:daily_recipe/providers/auth_provider.dart';
import 'package:daily_recipe/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // Forces only portait mode
  setApplicationSettings();

  runApp(Application());
}

void setApplicationSettings() {
  // Required function from flutter to be executed before runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Set only portait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Set totally transparent notifications bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Defines the providers to be shared on the app
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Daily Recipe',
        theme: ThemeData(
            // Application theme
            primaryColor: Color(0xFFF55A00),
            hintColor: Color(0xFFB2B7C6),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Hellix'),
        // Includes routes file
        routes: routes,
        initialRoute: '/auth/login',
      ),
    );
  }
}
