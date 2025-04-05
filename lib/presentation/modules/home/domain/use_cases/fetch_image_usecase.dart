import 'package:dio/dio.dart';
import 'package:wall_paper_app/core/base/base_use_case/use_case.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';

import '../../data/models/image_request_model.dart';
import '../repositories/fetch_image_repository.dart';

class FetchImageUseCase extends UseCase<Response, ImageRequestModel>{

  final FetchImageRepo _fetchImageRepo;

  FetchImageUseCase(this._fetchImageRepo);

  @override
  DioResponse call({required ImageRequestModel params}) async {
    return _fetchImageRepo.fetchImage(params);
  }
}