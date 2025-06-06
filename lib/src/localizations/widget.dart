


import 'package:flutter/material.dart';
import 'package:rooty/src/localizations/texts.dart';

class LocalizedText extends StatelessWidget {

  final String k;
  final Map<String, String>? args;
  final TextStyle? style;

  const LocalizedText(this. k,{super.key, this.args, this.style});

  RegExp _regExp(String key) => RegExp('\\{$key\\}');

  _replaceArguments(String text) {
    if(args == null || args!.isEmpty) return text;

    String replaced = text;

    args!.forEach((k, v) {
      replaced = replaced.replaceAll(_regExp(k), v);
    });
    return replaced;
  }

  @override
  Widget build(BuildContext context) {

    final resource = RootyTexts.of(context).get(k);

    if(resource == null) {
      return Text(
        k,
        semanticsLabel: k,
        textScaler: TextScaler.noScaling,
        style: style,
      );
    }

    return Text(
      _replaceArguments(resource.text),
      semanticsLabel: resource.description,
      textScaler: TextScaler.noScaling,
      style: style,
    );
  }
}
