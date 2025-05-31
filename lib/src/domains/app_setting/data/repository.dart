



import 'package:data_source/data_source.dart';
import 'package:rooty/src/domains/app_setting/domain/repository.dart';

import 'package:flutter/material.dart' show ThemeMode;


class AppSettingRepositoryImpl extends AppSettingRepository {

  late final UserLocalDataSource _dataSource;

  AppSettingRepositoryImpl() {
    _dataSource = UserLocalDataSource();
  }

  @override
  Future<ThemeMode> getTheme() async{
    final theme = await _dataSource.getTheme();

    return switch(theme) {
      0 => ThemeMode.light,
      1 => ThemeMode.dark,
      2 => ThemeMode.system,
      _ => ThemeMode.system
    };
  }

  @override
  Future<bool> setTheme(int theme) async{

    return _dataSource.setTheme(theme);
  }

}