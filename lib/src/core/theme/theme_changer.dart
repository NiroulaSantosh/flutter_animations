import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme;
  final SharedPreferences _preferences;
  static const String _themeKey = "THEMEMODE";

  ThemeChanger({bool? isDarkTheme, required SharedPreferences preferences})
      : _darkTheme = isDarkTheme ?? false,
        _preferences = preferences {
    _checkAndSavePreferences();
  }

  Future<void> _checkAndSavePreferences() async {
    if (_preferences.containsKey(_themeKey)) {
      _darkTheme = _preferences.getBool(_themeKey) ?? false;
    } else {
      await _preferences.setBool(_themeKey, _darkTheme);
    }

    notifyListeners();
  }

  bool get isDarkTheme => _darkTheme;

  Future<void> changeTheme() async {
    _darkTheme = !_darkTheme;
    await _preferences.setBool(_themeKey, _darkTheme);
    notifyListeners();
  }
}
