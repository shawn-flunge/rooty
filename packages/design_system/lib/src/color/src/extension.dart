


import 'package:flutter/material.dart';
import 'colors.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {

  final Color black;
  final Color white;

  ColorExtension._({
    this.black = RootyColors.black,
    this.white = RootyColors.white
  });

  ColorExtension.light({
    this.black = RootyColors.black,
    this.white = RootyColors.white
  });

  ColorExtension.dark({
    this.black = RootyColors.white,
    this.white = RootyColors.black
  });


  @override
  ThemeExtension<ColorExtension> copyWith() {
    return this;
  }

  @override
  ThemeExtension<ColorExtension> lerp(covariant ThemeExtension<ColorExtension>? other, double t) {

    if(other is ColorExtension){
      return ColorExtension._(
        black: Color.lerp(black, other.black, t)!,
        white: Color.lerp(white, other.white, t)!,
      );
    } else {
      return this;
    }
  }
}

extension RootyColor on BuildContext {

  ColorExtension get colors => Theme.of(this).extension<ColorExtension>()!;
}

