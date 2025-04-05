
import 'package:get_it/get_it.dart';
import '../../../presentation/modules/home/data/repositories/fetch_image_repo_impl.dart';
import '../../../presentation/modules/home/domain/repositories/fetch_image_repository.dart';
import '../../../presentation/modules/home/domain/use_cases/fetch_image_usecase.dart';
import '../../../presentation/modules/home/presentation/manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';
import '../../base/base_client/base_api_micro.dart';
import '../../base/base_service/base_service.dart';
import '../../utils/app_type_def.dart';

class InjectorService extends BaseService<FVoid, void> {
  static final InjectorService service = InjectorService();

  final GetIt inject = GetIt.instance;

  @override
  FVoid init({void param}) async {
    /// Initializing ApiServices First
    await initApiService();

    /// Initializing UseCases
    await initRepository();

    /// Initializing UseCases
    await initUseCase();

    /// Initializing Blocs
    await initBloc();
  }

  FRVoid initApiService() async {
    inject.registerSingleton<GetApiMicro>(GetApiMicro());
    inject.registerSingleton<PostApiMicro>(PostApiMicro());
    inject.registerSingleton<PutApiMicro>(PutApiMicro());
    inject.registerSingleton<PatchApiMicro>(PatchApiMicro());
    inject.registerSingleton<DeleteApiMicro>(DeleteApiMicro());
  }

  FRVoid initRepository() async {
    inject.registerSingleton<FetchImageRepo>(FetchImageRepoImpl());
  }

  FRVoid initUseCase() async {
    inject.registerSingleton<FetchImageUseCase>(FetchImageUseCase(inject()));
  }

  FRVoid initBloc() async {
    inject.registerFactory(() => RandomImageFetchBloc(inject()));
  }
}
