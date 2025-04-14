

import 'package:flutter/material.dart';
import 'package:design_system/theme.dart';
import 'package:rooty/src/pages/router.dart';

class RootyApp extends StatelessWidget {
  const RootyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rooty',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: rootyRouter,
    );
  }
}
