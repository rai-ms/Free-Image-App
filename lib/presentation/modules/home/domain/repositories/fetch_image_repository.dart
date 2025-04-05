import 'package:wall_paper_app/core/utils/app_type_def.dart';
import '../../data/models/image_request_model.dart';

abstract class FetchImageRepo{
  DioResponse fetchImage(ImageRequestModel request);
}