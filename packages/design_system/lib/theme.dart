


import 'package:design_system/src/color/color.dart';
import 'package:flutter/material.dart';

export 'src/color/color.dart';


final lightTheme = ThemeData(
    scaffoldBackgroundColor: RootyColors.white,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 36,
        color: Colors.red,
      ),

    ),
    extensions: [
      ColorExtension.light(),
    ]
);

final darkTheme = ThemeData(
    scaffoldBackgroundColor: RootyColors.black,
    extensions: [
      ColorExtension.dark()
    ]
);