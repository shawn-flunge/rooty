


import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/domains/app_setting/data/repository.dart';
import 'package:rooty/src/domains/app_setting/domain/usecase/get_theme.dart';
import 'package:rooty/src/domains/app_setting/domain/usecase/get_version.dart';
import 'package:rooty/src/domains/app_setting/provider/state.dart';

part 'provider.g.dart';

@riverpod
class AppSettingNotifier extends _$AppSettingNotifier {

  static Future<AppSettingState> initialize() async {
    final repository = AppSettingRepositoryImpl();
    final getTheme = GetTheme( repository );
    final theme = await getTheme(NoParam());

    final getVersion = GetVersion();
    final version = await getVersion(NoParam());

    return AppSettingState(
        themeMode: theme,
        version: version
    );
  }

  @override
  Future<AppSettingState> build() async{
    final setting = await initialize();

    return setting;
  }

  setTheme(ThemeMode newTheme) {
    state = AsyncData(
        AppSettingState(
          themeMode: newTheme
        )
    );
    final repository = AppSettingRepositoryImpl();
    final i = switch(newTheme) {
      ThemeMode.light => 0,
      ThemeMode.dark => 1,
      ThemeMode.system => 2,
    };
    repository.setTheme(i);
  }

}