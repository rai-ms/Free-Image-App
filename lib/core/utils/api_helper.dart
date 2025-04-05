import 'dart:io';

import 'config/app_config_impl.dart';


class ApiHelper {
  static Map<String, dynamic> get contentTypeCSRF => {
    "Content-Type": "application/json",
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.authorizationHeader: AppConfigurations().apiKey,
  };
}
