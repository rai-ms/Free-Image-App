import 'package:flutter/material.dart';
import '../services/route_service/app_routing.dart';

BuildContext get ctx => RouteService.navigatorKey.currentState!.context;

double deviceHeight = MediaQuery.of(ctx).size.height;
double deviceWidth = MediaQuery.of(ctx).size.width;
