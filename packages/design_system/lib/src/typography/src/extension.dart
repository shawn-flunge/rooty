



import 'package:flutter/material.dart';
import './styles.dart';

class TypographyExtension extends ThemeExtension<TypographyExtension> {

  final TextStyle title1;

  TypographyExtension({
    this.title1 = RootyTextStyles.title1
  });

  @override
  ThemeExtension<TypographyExtension> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TypographyExtension> lerp(covariant ThemeExtension<TypographyExtension>? other, double t) {
    return this;
  }

}

extension RootyTypo on BuildContext {

  abc({String? lang, Locale? locale}) {
    final t = Theme.of(this).extension<TypographyExtension>()!;

    // GoogleFonts.notoSansKrTextTheme(t.title1);
    switch(locale?.languageCode) {
      case null:
        return 'NotoSans';
      case 'ko':
        return 'NotoSansKR';
      case 'ja':
        return 'NotoSansJP';
      case 'zh':
        return 'NotoSansSC';
    }
  }
}
