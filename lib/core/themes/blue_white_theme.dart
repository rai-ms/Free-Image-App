import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/theme_base/theme_base.dart';
import 'package:wall_paper_app/core/utils/app_colors.dart';
import 'package:wall_paper_app/core/utils/app_constants.dart';

import 'entity/app_color_scheme.dart';

class DarkBlueTheme extends AppCustomTheme {
  const DarkBlueTheme() : super(Brightness.dark);

  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        primary: AppColors.darkGunMetal,
        onPrimary: AppColors.romanSilver,
        surface: AppColors.darkGunMetal.withValues(alpha:0.2),
        secondary: AppColors.whiteColor,
        primaryContainer: AppColors.blueColor.withValues(alpha:0.1),
        errorContainer: AppColors.kuCrimson,
        onErrorContainer: AppColors.maroon,
        surfaceTint: AppColors.whiteColor,
      );

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: colorScheme.surface,
      brightness: brightness,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      visualDensity: VisualDensity.standard,
      textTheme: textTheme(),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 23,
        space: 23,
        color: AppColors.greyColor.withValues(alpha:0.5),
      ),
      extensions: []
  );

  @override
  AppColorScheme? get colorSchemes => AppColorScheme(
    brightness: Brightness.light,
    photoUserNameColor: AppColors.whiteColor,
    photoDividerColor: AppColors.lightGunMetal
  );

  @override
  TextTheme textTheme() => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.secondary,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.secondary,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondary,
          fontSize: 12,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 12,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 26,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w300,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimary.withValues(alpha:0.56),
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 10,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 16,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w400,
        ),
      );
}
