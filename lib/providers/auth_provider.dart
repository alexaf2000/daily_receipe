import 'package:flutter/widgets.dart';

import 'package:daily_recipe/models/user.dart';

/// Shared class to be usable anywhere in the code
/// also called Global State
class AuthProvider extends ChangeNotifier {
  User _authenticatedUser;

  // Authenticated user getter
  User get authenticatedUser => _authenticatedUser;

  // Constructor
  AuthProvider();

  /// Log as a user, will notify to the listeners
  /// that was changed.dart
  /// Requires to get a `User` object
  void logIn(User user){
    // Assigns the new loggedUser user
    this._authenticatedUser = user;

    notifyListeners();
  }

  /// Returns if right now is logged into the application
  bool loggedIn(){
    return this._authenticatedUser != null;
  }

}
