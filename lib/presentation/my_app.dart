import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/services/my_app_listener/my_app_listener.dart';
import '../core/services/route_service/app_routing.dart';
import '../core/services/theme_service/theme_service.dart';
import '../core/utils/app_providers.dart';
import '../core/utils/app_type_def.dart';
import '../core/utils/space.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FVoid init() async {
      Space.precache();
  }

  @override
  void initState() {
    super.initState();
    init();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return ValueListenableBuilder<MyAppListenerModel>(
      valueListenable: MyAppListener.myAppListener,
      builder: (contextLang, myAppModel, child) {
        final botToastBuilder = BotToastInit();
        return  MultiBlocProvider(
        providers: BlocProviders.blocProviderForMyApp,
        child: MaterialApp.router(
            title: "Free Image App",
            routerDelegate: RouteService.routeService.goRouter.routerDelegate,
            routeInformationParser: RouteService.routeService.goRouter.routeInformationParser,
            routeInformationProvider: RouteService.routeService.goRouter.routeInformationProvider,
            debugShowCheckedModeBanner: false,
            locale: Locale(myAppModel.locale),
            theme: ThemeService.getTheme(
              context,
            ),
            builder: (BuildContext contextBuilder, child) {
              child = botToastBuilder(contextBuilder, child);
              return child;
            },
          ),
        );
      }
    );
  }
}