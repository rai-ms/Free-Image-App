
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static List<BlocProvider> provider = [
    ///TODO: All Bloc's must be added here to use through-out the app
    // BlocProvider<HomeBloc>(create: (BuildContext context) => InjectorService.service.injector<HomeBloc>()),
  ];
}