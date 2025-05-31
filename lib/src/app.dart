

import 'package:flutter/material.dart';
import 'package:design_system/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/domains/app_setting/provider/provider.dart';
import 'package:rooty/src/localizations/delegate.dart';
import 'package:rooty/src/pages/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RootyApp extends ConsumerWidget {
  const RootyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSetting = ref.watch(appSettingNotifierProvider);

    if(appSetting.isLoading) return const SizedBox();

    return MaterialApp.router(
      title: 'Rooty',
      themeMode: appSetting.value!.themeMode,
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
