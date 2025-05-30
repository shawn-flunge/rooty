

import 'package:flutter/material.dart';
import 'package:design_system/theme.dart';
import 'package:rooty/src/localizations/delegate.dart';
import 'package:rooty/src/pages/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: [
        RootyL10nDelegate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ko'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
