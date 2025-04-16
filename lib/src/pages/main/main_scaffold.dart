


import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rooty/src/pages/router.enum.dart';

class RootyMainScaffold extends StatelessWidget {

  final StatefulNavigationShell shell;

  const RootyMainScaffold({
    super.key,
    required this.shell
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: shell),
      bottomNavigationBar: RTBnb(
        shellIndex: shell.currentIndex,
        onTapChanged: (index) {

          if(index == 1 && GoRouter.of(context).state.name == Routes.course.name) {
            context.pop();
            // context.goNamed(Routes.courses.name);
          } else {
            shell.goBranch(index);
          }
        },
      ),
    );
  }
}
