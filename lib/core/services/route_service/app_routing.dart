import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/base/logger/app_logger_impl.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import '../../../presentation/modules/home/presentation/pages/controller/home_controller.dart';
import 'route_names.dart';

@protected
@immutable
class RouteService extends BaseService<void, void> {
  static final RouteService routeService = RouteService();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mainNavigation');

  @override
  void init({void param}) {
    log.d("RouteService Initialized");
  }

  final GoRouter goRouter = GoRouter(
    initialLocation: RoutesName.initialRoute,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    observers: [BotToastNavigatorObserver()],
    redirect: (context, state) {
      log.d(state.uri.path);
      return null;
    },
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            "Link Broken",
            style: AppStyles.medium.medium.red,
          ),
        ),
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: RoutesName.initialRoute,
        name: RoutesName.initialRoute,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MyHomePage(),
        ),
      ),
    ],
  );
}
