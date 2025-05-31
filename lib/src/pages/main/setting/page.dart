

import 'package:design_system/layout.dart';
import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/pages/router.enum.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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

        RTListTile(
          title: '버전',
          trailing: Text(
            '0.0.1'
          ),
        )
      ],
    );
  }
}


