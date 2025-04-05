import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/modules/home/presentation/manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';
import '../services/di/injector.dart';

class BlocProviders {
  static List<BlocProvider> get blocProviderForMyApp => [
    BlocProvider<RandomImageFetchBloc>(create: (context) => InjectorService.service.inject<RandomImageFetchBloc>()),
  ];
}