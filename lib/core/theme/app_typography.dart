import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const String fontHeading = 'Bricolage Grotesque';
  static const String fontBody = 'IBM Plex Sans';
  static const String fontArabic = 'IBM Plex Sans Arabic';

  // Headings - Bricolage Grotesque
  static const TextStyle h1 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 48,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h1Medium = TextStyle(
    fontFamily: fontHeading,
    fontSize: 48,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h11 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 45,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 40,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 33,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 28,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 23,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle h5Medium = TextStyle(
    fontFamily: fontHeading,
    fontSize: 23,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // Body - Bricolage Grotesque (Body1 & Body2)
  static const TextStyle body1 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 19,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body1Medium = TextStyle(
    fontFamily: fontHeading,
    fontSize: 19,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontHeading,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  // Body2 bold is IBM Plex Sans Medium 500
  static const TextStyle body2Bold = TextStyle(
    fontFamily: fontBody,
    fontSize: 16,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // Captions - IBM Plex Sans
  static const TextStyle caption1 = TextStyle(
    fontFamily: fontBody,
    fontSize: 13,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption1Medium = TextStyle(
    fontFamily: fontBody,
    fontSize: 13,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle caption2 = TextStyle(
    fontFamily: fontBody,
    fontSize: 11,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption2Medium = TextStyle(
    fontFamily: fontBody,
    fontSize: 11,
    height: 1.4,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  // Arabic typography helper
  static TextStyle arabic({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontArabic,
      fontSize: fontSize,
      height: 1.6,
      letterSpacing: 0,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

