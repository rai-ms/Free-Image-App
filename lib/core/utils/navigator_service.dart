
import '../services/route_service/app_routing.dart';

class NavigatorService {
  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {
    return RouteService.navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return RouteService.navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    return RouteService.navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    return RouteService.navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }
}
