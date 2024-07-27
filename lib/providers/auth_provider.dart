import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/database_helper.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    if (username != null && password != null) {
      final user = await DatabaseHelper.instance.getUser(username, password);
      if (user != null) {
        _user = user;
      }
    }
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    final user = await DatabaseHelper.instance.getUser(username, password);
    if (user != null) {
      _user = user;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      prefs.setString('password', password);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    final user = User(username: username, password: password);
    final id = await DatabaseHelper.instance.createUser(user);
    if (id > 0) {
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    notifyListeners();
  }
}
