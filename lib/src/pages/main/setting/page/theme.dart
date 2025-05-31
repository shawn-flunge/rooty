


import 'package:design_system/color.dart';
import 'package:design_system/layout.dart';
import 'package:design_system/widget.dart' show RTAppBar, RTListTile;
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/domains/app_setting/provider/provider.dart';
import 'package:rooty/src/localizations/texts.dart';


class ThemeSettingPage extends ConsumerWidget {
  const ThemeSettingPage({super.key});

  ThemeMode _theme(int i) {
    return switch(i) {
      0 => ThemeMode.light,
      1 => ThemeMode.dark,
      2 => ThemeMode.system,
      _ => ThemeMode.system
    };
  }

  String _text(int i) {
    return switch(i) {
      0 => 'light_mode',
      1 => 'dark_mode',
      2 => 'system_mode',
      _ => 'system_mode'
    };
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(appSettingNotifierProvider).value!.themeMode;

    return Scaffold(
      appBar: RTAppBar(title: RootyTexts.of(context).get('theme_setting')?.text ?? '-'),
      body: DefaultLayout(
        children: List.generate(3, (i) {
          final theme = _theme(i);
          final text = RootyTexts.of(context).get(_text(i))?.text;

          if(text == null) return const SizedBox();

          return RTListTile(
            title: text,
            trailing: theme == appTheme ? Icon(LucideIcons.check, color: context.colors.black,) : const SizedBox(),
            onTap: () {
              ref.read(appSettingNotifierProvider.notifier).setTheme(theme);
            },
          );
        })
      ),
    );
  }
}
