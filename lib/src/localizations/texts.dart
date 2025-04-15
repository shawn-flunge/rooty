import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RootyTexts {
  RootyTexts(this.locale);

  final Locale locale;

  static RootyTexts of(BuildContext context) {
    return Localizations.of<RootyTexts>(context, RootyTexts)!;
  }

  late Map<String, TextResource> _resources;

  Future<bool> load() async {
    final String data = await rootBundle.loadString('assets/i18n/${locale.languageCode}.arb');
    final Map<String, dynamic> arb = json.decode(data);
    final filtered = arb.entries
        .where((entry) => entry.key.contains('@') == false)
        .map((e) => MapEntry(e.key, TextResource(text: e.value, add: arb['@${e.key}'])));

    _resources = Map.fromEntries(filtered);
    return true;
  }

  TextResource get(String key) {
    return _resources[key]!;
  }
}


class TextResource {

  final String text;
  late final String? description;
  late final Map<String, dynamic>? placeholders;

  TextResource({required this.text, Map<String, dynamic>? add}) {
    description = add?['description'];
    placeholders = add?['placeholders'];
  }

  @override
  String toString() {
    return 'TextResource(text: $text, description: $description, placeholders: $placeholders)';
  }
}
