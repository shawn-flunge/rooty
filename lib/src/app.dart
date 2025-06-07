

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:design_system/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rooty/src/domains/app_setting/provider/provider.dart';
import 'package:rooty/src/domains/app_setting/provider/state.dart';
import 'package:rooty/src/localizations/delegate.dart';
import 'package:rooty/src/pages/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RootyApp extends ConsumerStatefulWidget {
  final AppSettingState setting;
  const RootyApp({super.key, required this.setting});

  @override
  ConsumerState<RootyApp> createState() => _RootyAppState();
}

class _RootyAppState extends ConsumerState<RootyApp> {

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      final status = await AppTrackingTransparency.requestTrackingAuthorization();

    });
  }

  @override
  Widget build(BuildContext context) {
    final appSetting = ref.watch(appSettingNotifierProvider);

    return MaterialApp.router(
      title: 'Rooty',
      themeMode: appSetting.value?.themeMode ?? widget.setting.themeMode,
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
