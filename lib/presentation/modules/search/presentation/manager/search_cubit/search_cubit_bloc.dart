

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/base/bloc_base/bloc_event.dart';
import 'package:wall_paper_app/core/base/bloc_base/bloc_event_state.dart';

import '../../../../home/domain/entities/image_model_search_home.dart';

part 'search_cubit_event.dart';
part 'search_cubit_state.dart';

class SearchCubitBloc extends Bloc<SearchCubitEvent, SearchCubitState> {
  SearchCubitBloc() : super(SearchCubitState()) {
    on<SearchCubitEvent>((event, emit) {});
  }
}
