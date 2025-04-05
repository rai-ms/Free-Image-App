import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';
import '../../../../../core/base/base_client/base_api_micro.dart';
import '../../../../../core/services/di/injector.dart';
import '../../../../../core/utils/api_end_point.dart';
import '../../../../../core/utils/api_helper.dart';
import '../../domain/repositories/fetch_image_repository.dart';
import '../models/image_request_model.dart';

class FetchImageRepoImpl extends FetchImageRepo{

  GetIt api = InjectorService.service.inject;

  @override
  DioResponse fetchImage(ImageRequestModel request) async {
    return await api<GetApiMicro>()(
      endPoint: ApiEndPoint.searchUrl,
      options: Options(
        headers: ApiHelper.contentTypeCSRF,
      ),
      queryParam: request.queryParam
    );
  }
}