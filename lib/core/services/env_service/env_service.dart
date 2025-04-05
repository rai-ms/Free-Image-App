import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/dot_env/dot_env.dart';
import 'package:wall_paper_app/core/dot_env/dot_env_key.dart';
import 'package:wall_paper_app/core/services/flavour_service/dev_flavour.dart';
import 'package:wall_paper_app/core/utils/app_enum.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';

import '../../base/logger/app_logger_impl.dart';

class EnvService extends BaseService<FVoid, FlavourType> {
  static final EnvService service = EnvService();

  EnvService();

  final DotEnv dotenv = DotEnv();

  static Map<String, dynamic> envConfig = {};


  @override
  FVoid init({required FlavourType param}) async {
    try {
      await dotenv.loadEnv(fileName: getEnvPath(param));
      envConfig = dotenv.env;
    } catch (e) {
      log.e("ENV Service Initialisation Error $e");
    }
  }

  String getEnvPath(FlavourType type) {
    switch (type) {
      case FlavourType.dev:
        return 'assets/env/dev.env';
      case FlavourType.prod:
        return 'assets/env/.env';
      case FlavourType.uat:
        return 'assets/env/stg.env';
      case FlavourType.unknown:
        return 'assets/env/dev.env';
    }
  }

  Future<String> getDataFromEnv({String? key}) async {
    if (dotenv.isInitialized) {
      return dotenv.env[key ?? DotEnvKey.baseUrl] ?? "";
    } else {
      await dotenv.loadEnv(fileName: DotEnvKey.baseUrl);
      return dotenv.env[key ?? DotEnvKey.baseUrl] ?? "";
    }
  }

  Future<FreeImageFlavourDev> getConfig() async {
    return FreeImageFlavourDev(
      baseUrl: await getDataFromEnv(),
    );
  }
}
