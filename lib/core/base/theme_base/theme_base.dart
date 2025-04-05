import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/themes/entity/app_color_scheme.dart';

@protected
@immutable
abstract class AppCustomTheme {
  final Brightness brightness;
  const AppCustomTheme(this.brightness, {this.colorSchemes});

  ThemeData get themeData;

  TextTheme textTheme();

  final AppColorScheme? colorSchemes;

  ColorScheme get colorScheme;
}