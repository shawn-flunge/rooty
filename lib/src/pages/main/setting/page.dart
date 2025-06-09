
import 'dart:io';

import 'package:design_system/color.dart';
import 'package:design_system/layout.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rooty/src/domains/app_setting/provider/provider.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/router.enum.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  String _getSystemLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final lang = RootyTexts.of(context).get('lang_$locale')?.text ?? Platform.localeName.split('_').first;
    return lang;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        RTListTile(
          title: RootyTexts.of(context).get('theme_setting')?.text ?? '-',
          onTap: () {
            context.goNamed(Routes.themeSetting.name);
          },
        ),

        Consumer(
          builder: (c, ref, _) {
            final setting = ref.watch(appSettingNotifierProvider);
            return RTListTile(
              title: RootyTexts.of(context).get('version')?.text ?? '',
              trailing: setting.isLoading
              ? const SizedBox()
              : Text(
                  setting.value!.version,
                  style: TextStyle(
                    fontSize: 14,
                    color: context.colors.disabled,
                    fontVariations: [
                      FontVariation.weight(360)
                    ]
                  ),
                ),
            );
          }
        ),

        if(defaultTargetPlatform == TargetPlatform.iOS)
          RTListTile(
            title: RootyTexts.of(context).get('language')?.text ?? '',
            onTap: () {
              openAppSettings();
            },
            trailing: LocalizedText(
              _getSystemLanguage(context),
              style: TextStyle(
                  fontSize: 14,
                  color: context.colors.disabled,
                  fontVariations: [
                    FontVariation.weight(360)
                  ]
              ),
            ),
          )
      ],
    );
  }
}


