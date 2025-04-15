

import 'package:flutter/material.dart';
import 'package:rooty/src/localizations/texts.dart';

class RootyL10nDelegate extends LocalizationsDelegate<RootyTexts> {
  const RootyL10nDelegate._();

  @override
  bool isSupported(Locale locale) => ['en', 'ko'].contains(locale.languageCode);

  @override
  Future<RootyTexts> load(Locale locale) async {
    final RootyTexts localizations = RootyTexts(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(RootyL10nDelegate old) => false;

  static const LocalizationsDelegate<RootyTexts> delegate = RootyL10nDelegate._();
}