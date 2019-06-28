import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../users/user.dart';

class UserModel extends Model {
  Users _authenticatedUser;
  bool loggedIn;

  String get user {
    return _authenticatedUser.username;
}

  void login(String username, String password) {
    _authenticatedUser = Users(username: username, password: password);
  }
}