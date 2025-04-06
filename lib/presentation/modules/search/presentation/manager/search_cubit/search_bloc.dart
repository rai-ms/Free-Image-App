

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/base/bloc_base/bloc_event.dart';
import 'package:wall_paper_app/core/base/bloc_base/bloc_event_state.dart';
import 'package:wall_paper_app/core/utils/app_type_def.dart';
import 'package:wall_paper_app/presentation/modules/home/data/models/image_request_model.dart';
import '../../../../../../core/base/logger/app_logger_impl.dart';
import '../../../../home/domain/entities/image_model_search_home.dart';
import '../../../../home/domain/use_cases/fetch_image_usecase.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState<ImageResponseModel>> {

  final FetchImageUseCase _fetchImageUseCase;

  SearchBloc(this._fetchImageUseCase) : super(SearchBlocState()) {
    on<SearchBlocEvent>((event, emit) {});
    on<OnSearchSearchBlocEvent>(_onSearch);
    on<OnSearchPaginationBlocEvent>(_onSearchPagination);
  }


  FVoid _onSearch(OnSearchSearchBlocEvent event, Emitter<SearchBlocState<ImageResponseModel>> emit) async {
    try{
      emit(state.copyWith(state: state.loading, event: event, eventName: event.searchQuery));
      var response = await _fetchImageUseCase(params: ImageRequestModel(state.pageNo, event.searchQuery));
      if(response.statusCode == HttpStatus.ok){
        emit(state.copyWith(data: ImageResponseModel.fromJson(response.data), state: state.success));
      }
      else{
        emit(state.copyWith(error: response.statusMessage, state: state.failed));
      }
    }
    catch(e){
      log.e("Error on _onSearch $e");
      emit(state.copyWith(state: state.failed, error: e.toString()));
    }
  }

  FVoid _onSearchPagination(OnSearchPaginationBlocEvent event, Emitter<SearchBlocState<ImageResponseModel>> emit) async {
    try{
      emit(state.copyWith(event: event, isPagination: true));
      var response = await _fetchImageUseCase(params: ImageRequestModel(state.pageNo, state.eventName ?? ""));
      if(response.statusCode == HttpStatus.ok){
        var photos = ImageResponseModel.fromJson(response.data).photos;
        emit(state.copyWith(
            data: state.data?.copyWith(photos: [...?state.data?.photos, ...?photos]),
            state: state.success
          )
        );
      }
      else{
        emit(state.copyWith(error: response.statusMessage, state: state.failed));
      }
    }
    catch(e){
      log.e("Error on _onSearchPagination $e");
    }
  }

}
