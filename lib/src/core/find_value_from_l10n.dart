



import 'dart:io';

extension L10nMap on Map<String, dynamic> {


  /// findString
  String findString(String key) {
    /// Localizations.localeOf(context).languageCode;
    final lang = Platform.localeName.split('_').first;
    final localizedString = this[key][lang];
    return localizedString;
  }

}