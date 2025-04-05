import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/base/flavour_base/flavour.dart';
import 'package:wall_paper_app/core/services/env_service/env_service.dart';
import 'package:wall_paper_app/core/utils/app_enum.dart';
import '../../base/app_configurations.dart';
import '../../base/logger/app_logger_impl.dart';
import '../../utils/config/app_config_impl.dart';


@protected
class FlavourService extends BaseService<Future<String?>, String> {
  FlavourService();

  static final FlavourService service = FlavourService();
  late final Flavour flavour;
  late final AppConfigurationsBase appConfigurations;

  @override
  Future<String?> init({String? param}) async {
    String data = const String.fromEnvironment("FLAVOUR");
    FlavourType type = FlavourType.fromString(val: data);
    flavour = await getFlavour(type);
    appConfigurations = AppConfigurations();
    log.d("Flavour is ${flavour.runtimeType} and base Url is ${flavour.baseUrl}");
    return data;
  }

  Future<Flavour> getFlavour(FlavourType type) async {
    await EnvService.service.init(param: type);
    return await EnvService.service.getConfig();
  }
}
