


import 'package:design_system/layout.dart' show PlatformLayout;
import 'package:design_system/widget.dart' show RTBnb, BnbItem, RTAppBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/localizations/texts.dart';
import 'package:rooty/src/localizations/widget.dart';
import 'package:rooty/src/pages/router.enum.dart';

class RootyMainScaffold extends StatelessWidget {

  final StatefulNavigationShell shell;

  const RootyMainScaffold({
    super.key,
    required this.shell
  });

  @override
  Widget build(BuildContext context) {

    return PlatformLayout(
      child: Scaffold(
        appBar: shell.currentIndex == 0
          ? null
          : RTAppBar(
              title: shell.currentIndex == 1 
                  ? RootyTexts.of(context).get('learn')?.text ?? ''
                  : RootyTexts.of(context).get('settings')?.text ?? '',
            ),
        body: SafeArea(child: shell),
        bottomNavigationBar: RTBnb(
          shellIndex: shell.currentIndex,
          items: [
            BnbItem(
              icon: LucideIcons.house,
              text: RootyTexts.of(context).get('home')?.text ?? ''
            ),
            BnbItem(
                icon: LucideIcons.square_library,
                text: RootyTexts.of(context).get('learn')?.text ?? ''
            ),
            BnbItem(
                icon: LucideIcons.settings,
                text: RootyTexts.of(context).get('settings')?.text ?? ''
            ),
          ],
          onTapChanged: (index) {
            HapticFeedback.selectionClick();

            if(index == 1 && GoRouter.of(context).state.name == Routes.course.name) {
              context.pop();
              // context.goNamed(Routes.courses.name);
            } else {
              shell.goBranch(index);
            }
          },
        ),
      )
    );
  }
}
