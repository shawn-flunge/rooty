

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rooty/firebase_options.dart';
import 'package:rooty_admin/rooty_admin.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    RootyAdminApp()
  );
}