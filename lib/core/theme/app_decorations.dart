import 'package:flutter/material.dart';

abstract final class AppRadii {
  static const double r3 = 3.0;
  static const double r7 = 7.0;
  static const double r13 = 13.0; // icon tiles
  static const double r28 = 28.0; // cards, sheets
  static const double r40 = 40.0;
  static const double r100 = 100.0; // chips and pills (Stadium)

  static const Radius radius3 = Radius.circular(r3);
  static const Radius radius7 = Radius.circular(r7);
  static const Radius radius13 = Radius.circular(r13);
  static const Radius radius28 = Radius.circular(r28);
  static const Radius radius40 = Radius.circular(r40);
  static const Radius radius100 = Radius.circular(r100);

  static const BorderRadius border3 = BorderRadius.all(radius3);
  static const BorderRadius border7 = BorderRadius.all(radius7);
  static const BorderRadius border13 = BorderRadius.all(radius13);
  static const BorderRadius border28 = BorderRadius.all(radius28);
  static const BorderRadius border40 = BorderRadius.all(radius40);
  static const BorderRadius border100 = BorderRadius.all(radius100);
}

abstract final class AppSpacing {
  static const double s4 = 4.0;
  static const double s5 = 5.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s19 = 19.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;

  // Chip padding
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0);
  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
}

abstract final class AppShadows {
  // Button shadow: black 12% y4 blur 16
  static const BoxShadow btnShadow = BoxShadow(
    color: Color(0x1F000000), // 12% black
    offset: Offset(0, 4),
    blurRadius: 16,
  );

  // Side shadow: black 12% x6 blur 16
  static const BoxShadow sideShadow = BoxShadow(
    color: Color(0x1F000000),
    offset: Offset(6, 0),
    blurRadius: 16,
  );

  // Card shadow: black 8% blur 4
  static const BoxShadow cardShadow = BoxShadow(
    color: Color(0x14000000), // 8% black
    offset: Offset(0, 2),
    blurRadius: 4,
  );
}

