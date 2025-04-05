import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/base/logger/app_logger_impl.dart';
import 'package:wall_paper_app/core/services/my_app_listener/my_app_listener.dart';
import 'package:wall_paper_app/core/services/storage_service/hive_constants.dart';
import 'package:wall_paper_app/core/services/storage_service/storage_service.dart';
import 'package:wall_paper_app/core/utils/app_enum.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';

/// [AppLanguageService] handles the whole language service in the app
@protected
class AppLanguageService extends BaseService<FVoid, String?> {
  /// [services] is a singleton variable for the language Service
  static final AppLanguageService services = AppLanguageService();

  /// [langCode] can be use to get the language code any time, any where in the app
  static String langCode = 'en';

  static AppLanguage lang = AppLanguage.english;

  /// [languageChange] need to assign in the my app to build the changes over the whole app
  /// Default lang code is en (i.e. English) but user can change as per their requirement
  late ValueNotifier<Locale> languageChange = ValueNotifier(const Locale('en'));

  /// NOTE: Below method must call in the my app, otherwise [Lokalise] will throws error of null
  /// [sdkToken] and [projectId] can be assign for the OTA service provided by the intl lokalise
  /// TODO(SharedPreference): It is mandatory to initialize the SharedPreference before calling [init] in [AppPreference]
  @override
  FVoid init({String? param}) async {
    // Fetching the device specific language
    AppLanguage systemLanguage = AppLanguage.fromString(Platform.localeName.substring(0, 2));

    // Fetching language from local
    String? localLang =
        await StorageService.service.getCore(key: HiveConstants.langKey);

    // if (loca lLang == null) {
    //   log.d("No language found in local");
    //   log.d("Now looking for the support of language from device");
    //   List<Locale> supportLocals = S.delegate.supportedLocales;
    //   for (var action in supportLocals) {
    //     log.d(
    //         "Action Lang ${action.languageCode} and System Lang $systemLanguage");
    //     if (action.languageCode == systemLanguage.code.substring(0, 2)) {
    //       localLang = action.languageCode;
    //       log.d("Language matched in device");
    //       break;
    //     }
    //   }
    // }

    localLang ??= langCode;
    lang = AppLanguage.fromString(localLang);
    languageChange = ValueNotifier<Locale>(Locale(localLang));
    MyAppListener.service.addLocaleListener();
    log.d("AppLanguageService Initialized");
  }

  /// [changeLanguage] method need to run, when require to update the language
  FVoid changeLanguage({required AppLanguage language}) async {
    // List<Locale> supportLocals = S.delegate.supportedLocales;
    //
    // // Handling for wrong locale code
    // if (language.code.length < 2) {
    //   log.d("Not a valid language");
    //   return;
    // }
    //
    // // Crop the locale code, if greater, below logic can be removed as per the requirement
    // String localCode = language.code;
    // if (localCode.length > 3) {
    //   localCode = language.code.substring(0, 2);
    // }
    //
    // var locale = Locale(language.code);
    //
    // log.d("Data received for changing lang ${locale.languageCode}");
    //
    // if (supportLocals.contains(locale)) {
    //   // Getting the Validate string for the language code
    //   localCode = (locale.countryCode?.isEmpty ?? false)
    //       ? locale.languageCode
    //       : locale.toString();
    //
    //   // finally Changing the language here after handling the edge-cases
    //   languageChange.value = Locale(localCode);
    //   await S.load(Locale(localCode));
    //   MyAppListener.service.addLocaleListener();
    //
    //   // Persisting the language code to local
    //   langCode = localCode;
    //
    //   // Persisting the language code in the Persistent storage
    //   await StorageService.service
    //       .setCore(key: HiveConstants.langKey, value: langCode);
    // }
  }
}
