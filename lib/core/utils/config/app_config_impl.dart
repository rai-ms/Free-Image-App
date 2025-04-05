import 'package:wall_paper_app/core/services/env_service/env_service.dart';

import '../../base/app_configurations.dart';
import '../../dot_env/dot_env_key.dart';

class AppConfigurations implements AppConfigurationsBase{

  @override
  bool get isNetworkLoggerEnable => true;

  @override
  bool get isLoggerEnable => true;

  @override
  String get apiKey => EnvService.envConfig[DotEnvKey.apiKey];
}