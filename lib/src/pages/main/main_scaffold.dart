


import 'package:design_system/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          shell.goBranch(index);
        },
      ),
    );
  }
}
