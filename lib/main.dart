import 'package:data_source/data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rooty/firebase_options.dart';
import 'package:rooty/src/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /// local 개발 시 호출
  dataConnectEmulatorInit();

  runApp(
    ProviderScope(child: RootyApp())
  );
}
