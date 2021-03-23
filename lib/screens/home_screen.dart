import 'package:daily_recipe/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Text("Hola: ${authProvider.authenticatedUser.email}")),
    ));
  }
}
