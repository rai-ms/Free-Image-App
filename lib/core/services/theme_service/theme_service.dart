import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/themes/blue_white_theme.dart';
import 'package:wall_paper_app/core/themes/dark_gun_metal_theme.dart';
import 'package:wall_paper_app/core/themes/dark_theme.dart';
import 'package:wall_paper_app/core/themes/entity/app_color_scheme.dart';
import 'package:wall_paper_app/core/themes/light_theme.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/services/my_app_listener/my_app_listener.dart';
import 'package:wall_paper_app/core/services/storage_service/hive_constants.dart';
import 'package:wall_paper_app/core/services/storage_service/storage_service.dart';
import 'package:wall_paper_app/core/utils/app_enum.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';
import '../../base/logger/app_logger_impl.dart';
import '../route_service/app_routing.dart';

/// [ThemeService] class is responsible to provide and update the [Theme] in the app
@protected
@immutable
class ThemeService extends BaseService<void, AppTheme> {
  /// [themeListener] is the variable which have the theme value
  /// Overriding the value of [themeListener] react to the changes of theme in the app
  static ValueNotifier<AppTheme> themeListener =
      ValueNotifier<AppTheme>(AppTheme.darkBlue);

  /// [themeService] singleton Object of theme class
  static ThemeService themeService = ThemeService();

  static BuildContext get context => RouteService.navigatorKey.currentContext!;

  @override
  void init({AppTheme? param}) {
    log.d("ThemeService Initialized");
  }

  /// [getThemeType] should call before get theme to update the theme data
  static void getThemeType(BuildContext context) {
    String? theme = StorageService.service.getCore(key: HiveConstants.themeKey);
    AppTheme appTheme = AppTheme.getTheme(theme);

    // if (appTheme == AppTheme.system) {
    //   final brightness = MediaQuery.platformBrightnessOf(context);
    //   brightness == Brightness.dark ? themeListener.value = AppTheme.dark : themeListener.value = AppTheme.light;
    // }
    // else {
    //   themeListener.value = appTheme;
    // }

    themeListener.value = appTheme;
  }

  /// [updateTheme] should call to update the theme
  FVoid updateTheme(AppTheme theme) async {
    themeListener.value = theme;
    MyAppListener.service.addThemeListener();
    await StorageService.service
        .setCore(key: HiveConstants.themeKey, value: theme.getThemeVal());
  }

  /// [getTheme] is return in main, to provide the [ThemeData]
  static ThemeData getTheme(BuildContext context) {
    getThemeType(context);
    switch (themeListener.value) {
      case AppTheme.darkBlue:
        return BlueWhiteTheme().themeData;
      case AppTheme.lightRed:
        return DarkBlueTheme().themeData;
      case AppTheme.light:
        return AppLightTheme().themeData;
      case AppTheme.dark:
        return AppDarkTheme().themeData;
      default:
        // final brightness = MediaQuery.platformBrightnessOf(context);
        // return brightness == Brightness.dark ? DarkBlueTheme(colorSchemes: colorScheme).getTheme() : BlueWhiteTheme(colorSchemes: colorScheme).getTheme();
        return AppLightTheme().themeData;
    }
  }
}

AppColorScheme get appTheme => Theme.of(ThemeService.context).extension<AppColorScheme>()!;
