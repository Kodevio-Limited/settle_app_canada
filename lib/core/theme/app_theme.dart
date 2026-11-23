import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_decorations.dart';

ThemeData createAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white50,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white50,
      error: AppColors.error,
      onError: AppColors.white50,
      surface: AppColors.white50,
      onSurface: AppColors.mainFont,
    ),
    fontFamily: AppTypography.fontBody,
    textTheme: const TextTheme(
      displayLarge: AppTypography.h1,
      displayMedium: AppTypography.h2,
      displaySmall: AppTypography.h3,
      headlineMedium: AppTypography.h4,
      headlineSmall: AppTypography.h5,
      titleLarge: AppTypography.body1Medium,
      bodyLarge: AppTypography.body1,
      bodyMedium: AppTypography.body2,
      labelLarge: AppTypography.body2Bold,
      bodySmall: AppTypography.caption1,
      labelSmall: AppTypography.caption2,
    ).apply(
      bodyColor: AppColors.mainFont,
      displayColor: AppColors.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white50,
        minimumSize: const Size.fromHeight(56),
        shape: const StadiumBorder(),
        elevation: 0,
        shadowColor: Colors.transparent,
        textStyle: AppTypography.body1Medium,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        minimumSize: const Size.fromHeight(56),
        shape: const StadiumBorder(),
        side: const BorderSide(color: AppColors.border, width: 1.5),
        textStyle: AppTypography.body1Medium,
      ),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.white50,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadii.border28,
        side: BorderSide(color: AppColors.border, width: 1.0),
      ),
      margin: EdgeInsets.zero,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
  );
}
