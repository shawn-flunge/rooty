import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rooty/firebase_options.dart';
import 'package:rooty/src/app.dart';
import 'package:rooty/src/domains/app_setting/provider/provider.dart';
import 'package:rooty/supabase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'production'
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await SupabaseOptions.initialize();
  final setting = await AppSettingNotifier.initialize();

  runApp(
      ProviderScope(child: RootyApp(setting: setting,))
  );
}
