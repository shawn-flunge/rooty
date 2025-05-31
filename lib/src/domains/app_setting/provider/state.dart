

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class AppSettingState with _$AppSettingState {

  const factory AppSettingState({
    @Default(ThemeMode.system,) ThemeMode themeMode
  }) = _AppSettingState;
}