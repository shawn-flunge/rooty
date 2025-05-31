


import 'package:flutter/material.dart';
import 'package:rooty/src/core/usecase.dart';
import 'package:rooty/src/domains/app_setting/domain/repository.dart';

class GetTheme extends UseCase<ThemeMode, NoParam> {

  final AppSettingRepository repository;

  GetTheme(this.repository);

  @override
  Future<ThemeMode> call(NoParam param) async{
    return repository.getTheme();
  }

}