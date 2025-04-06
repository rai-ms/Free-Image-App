import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wall_paper_app/presentation/my_app.dart';
import 'core/base/bloc_base/app_bloc_observer.dart';
import 'core/base/logger/app_logger_impl.dart';
import 'core/services/di/injector.dart';
import 'core/services/flavour_service/flavour_service.dart';
import 'core/services/internet_service/internet_service.dart';
import 'core/services/my_app_listener/my_app_listener.dart';
import 'core/services/route_service/app_routing.dart';
import 'core/services/storage_service/storage_service.dart';
import 'core/services/theme_service/theme_service.dart';
import 'core/utils/app_type_def.dart';
import 'core/utils/orientation_extension.dart';
import 'core/utils/size_utils.dart';

void main() {
  unawaited(
    runZonedGuarded(() async {
      await appInit();
      runApp(
        const MyApp(),
      );
    }, (error, stackTrace) {
      log.crash(error: error, stackTrace: stackTrace, reason: 'main');
    })?.catchError((e, trace) {
      log.crash(error: e, stackTrace: trace, reason: 'main');
      exit(-1);
    }),
  );
}

FVoid appInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();
  OrientationExtension.lockVertical();
  await StorageService.service.init();
  await FlavourService.service.init();
  await InjectorService.service.init();
  RouteService.routeService.init();
  ThemeService.themeService.init();
  InternetService.service.init();
  MyAppListener.service.init();
  Bloc.observer = AppBlocObserver();
  SizeUtils.setScreenSize(
    const BoxConstraints(
      maxHeight: figmaDesignHeight,
      maxWidth: figmaDesignWidth,
    ),
    Orientation.portrait,
  );

  log.d("All Services Initialized");
}
