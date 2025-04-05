import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/theme_base/theme_base.dart';
import 'package:wall_paper_app/core/utils/app_colors.dart';
import 'package:wall_paper_app/core/utils/app_constants.dart';

class BlueWhiteTheme extends AppCustomTheme {
  const BlueWhiteTheme({super.colorSchemes}) : super(Brightness.light);

  @override
  ColorScheme get colorScheme => ColorScheme.light(
      primary: AppColors.blueColor,
      onPrimary: AppColors.romanSilver,
      onSurface: AppColors.greyColor.withValues(alpha:0.1),
      surface: AppColors.antiFlashWhite.withValues(alpha:0.9),
      secondary: AppColors.darkGunMetal,
      onSecondary: AppColors.whiteColor,
      primaryContainer: AppColors.lightGrey,
      onPrimaryContainer: AppColors.antiFlashWhite,
      errorContainer: AppColors.kuCrimson,
      onErrorContainer: AppColors.darkBlueColor,
      inversePrimary: AppColors.darkRedColor,
      tertiary: AppColors.blackColor,
      surfaceTint: AppColors.lightGunMetal);

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
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        brightness: brightness,
        visualDensity: VisualDensity.standard,
        colorScheme: colorScheme,
        dialogBackgroundColor: AppColors.antiFlashWhite,
        fontFamily: AppFontsConstants.poppins,
        textTheme: textTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
          ),
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
          unselectedLabelStyle: TextStyle(
            color: colorScheme.secondary,
            fontSize: 14,
            fontFamily: AppFontsConstants.poppins,
          ),
          labelStyle: TextStyle(
            color: colorScheme.secondary,
            fontSize: 14,
            fontFamily: AppFontsConstants.poppins,
            fontWeight: FontWeight.w600,
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.surface;
              }
              return colorScheme.primary;
            }),
            surfaceTintColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return colorScheme.surface;
              }
              return colorScheme.primary;
            }),
          ),
        ),
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
