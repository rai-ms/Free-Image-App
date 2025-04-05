import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/theme_base/theme_base.dart';
import 'package:wall_paper_app/core/utils/app_colors.dart';
import 'package:wall_paper_app/core/utils/app_constants.dart';

import 'entity/app_color_scheme.dart';

class AppLightTheme extends AppCustomTheme {
  const AppLightTheme() : super(Brightness.light);

  @override
  ColorScheme get colorScheme => ColorScheme.light(
      primary: AppColors.whiteColor,
      onPrimary: AppColors.romanSilver,
      onSurface: AppColors.greyColor.withValues(alpha:0.1),
      surface: AppColors.whiteColor.withValues(alpha:0.9),
      secondary: AppColors.blackColor,
      onSecondary: AppColors.whiteColor,
      primaryContainer: AppColors.blueColor,
      onPrimaryContainer: AppColors.whiteColor,
      errorContainer: AppColors.kuCrimson,
      onErrorContainer: AppColors.darkBlueColor,
      inversePrimary: AppColors.darkRedColor,
      tertiary: AppColors.blackColor,
      scrim: AppColors.blueColor,
      surfaceTint: AppColors.blueColor
  );

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: colorScheme.surface,
      brightness: brightness,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      dialogBackgroundColor: colorScheme.primary,
      fontFamily: AppFontsConstants.poppins,
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
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.tertiary;
            }
            return colorScheme.tertiary;
          }),
          surfaceTintColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.tertiary;
            }
            return colorScheme.tertiary;
          }),
        ),
      ),
      extensions: <AppColorScheme>[colorSchemes!]
  );

  @override
  AppColorScheme? get colorSchemes => AppColorScheme(
    brightness: Brightness.light,
    photoUserNameColor: AppColors.whiteColor,
    photoDividerColor: AppColors.darkElectricBlue,
    photoLinerGradientColor: [
      AppColors.lightGunMetal, AppColors.whiteColor
    ],
    photoBackgroundColor: AppColors.colorBackgroundScaffold,
    scaffoldBackgroundColor: AppColors.colorBackgroundScaffold,
    photoUserBorderColor: AppColors.whiteColor,
    photoClickIconColor: AppColors.lightGrey,
    photoAltColor: AppColors.lightGrey,
    likeWidgetBorderColor: AppColors.whiteColor,
    likeWidgetBackgroundColor: AppColors.darkGunMetal,
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
        titleLarge: TextStyle(
          color: colorScheme.secondary,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: colorScheme.secondary,
          fontSize: 16,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: colorScheme.secondary,
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
          color: colorScheme.secondary,
          fontSize: 12,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: colorScheme.secondary,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: colorScheme.secondary,
          fontSize: 10,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 18,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 16,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
            color: colorScheme.errorContainer,
            fontSize: 14,
            fontFamily: AppFontsConstants.poppins,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis),
      );
}
