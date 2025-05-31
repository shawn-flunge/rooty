


import 'package:flutter/material.dart' show ThemeMode;

abstract class AppSettingRepository {


  Future<ThemeMode> getTheme();

  Future<bool> setTheme(int theme);
}