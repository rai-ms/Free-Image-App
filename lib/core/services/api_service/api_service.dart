// ignore_for_file: implementation_imports

import 'package:dio/src/dio.dart';
import 'package:dio/src/options.dart';
import 'package:wall_paper_app/core/base/base_client/base_client.dart';
import 'package:wall_paper_app/core/base/base_client/base_interceptor.dart';
import 'package:wall_paper_app/core/base/base_service/base_service.dart';
import 'package:wall_paper_app/core/utils/config/app_config_impl.dart';
import 'dart:developer' as d;

import '../flavour_service/flavour_service.dart';

class ApiService extends BaseService<void, String?> with BaseClientDio {
  static const ApiService service = ApiService();

  const ApiService();

  @override
  BaseOptions get baseOptions => BaseOptions(
    baseUrl: FlavourService.service.flavour.baseUrl,
    connectTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 5),
  );

  @override
  Dio get dio => _dio();

  Dio _dio() {
    var dio = Dio(baseOptions);
    if(AppConfigurations().isNetworkLoggerEnable) {
      dio.interceptors.add(
      BaseInterceptor(
        logPrint: d.log,
        responseBody: false,
        responseHeader: false,
        requestBody: false,
        requestHeader: false,
        queryParameters: false,
        showProcessingTime: false,
        convertFormData: false
      )
    );
    }
    return dio;
  }

  @override
  void init({String? param}) {
    d.log("Initializing ApiService");
  }
}
