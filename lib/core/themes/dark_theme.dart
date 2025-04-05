import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/theme_base/theme_base.dart';
import 'package:wall_paper_app/core/utils/app_colors.dart';
import 'package:wall_paper_app/core/utils/app_constants.dart';

class AppDarkTheme extends AppCustomTheme {
  const AppDarkTheme({super.colorSchemes}) : super(Brightness.dark);

  @override
  ColorScheme get colorScheme => ColorScheme.dark(
      primary: AppColors.blackColor,
      onPrimary: AppColors.romanSilver,
      surface: AppColors.blackColor.withValues(alpha:0.7),
      onSurface: AppColors.greyColor.withValues(alpha:0.4),
      secondary: AppColors.whiteColor,
      onSecondary: AppColors.blackColor,
      primaryContainer: AppColors.lightGrey,
      errorContainer: AppColors.kuCrimson,
      onErrorContainer: AppColors.maroon,
      onPrimaryContainer: AppColors.lightBlack.withValues(alpha:0.4),
      inversePrimary: AppColors.blackColor,
      tertiary: AppColors.whiteColor,
      surfaceTint: AppColors.whiteColor);

  @override
  ThemeData get themeData => ThemeData(
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.onSurface,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: colorScheme.secondary,
            fontWeight: FontWeight.w500,
            fontSize: 20),
        iconTheme: IconThemeData(color: colorScheme.secondary),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            strokeAlign: 0.5,
            color: colorScheme.surface,
            style: BorderStyle.solid,
          ),
        ),
      ),
      brightness: brightness,
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
      textTheme: textTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
            backgroundColor: colorScheme.onSurface),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: AppColors.greyColor.withValues(alpha:0.9),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
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
      tabBarTheme: TabBarTheme(
        indicatorColor: colorScheme.secondary,
        labelPadding: EdgeInsets.zero,
        labelColor: colorScheme.secondary,
        unselectedLabelColor: colorScheme.secondary.withValues(alpha:0.6),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
        ),
        labelStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontFamily: AppFontsConstants.poppins,
          fontWeight: FontWeight.w600,
        ),
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
      ));

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
