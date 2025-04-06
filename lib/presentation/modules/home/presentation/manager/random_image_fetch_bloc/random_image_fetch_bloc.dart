import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/base/bloc_base/bloc_event_state.dart';
import '../../../../../../core/base/bloc_base/bloc_event.dart';
import '../../../../../../core/base/logger/app_logger_impl.dart';
import '../../../data/models/image_request_model.dart';
import '../../../domain/entities/image_model_search_home.dart';
import '../../../domain/use_cases/fetch_image_usecase.dart';

part 'random_image_fetch_event.dart';
part 'random_image_fetch_state.dart';

class RandomImageFetchBloc extends Bloc<RandomImageFetchEvent, RandomImageFetchState<ImageResponseModel>> {

  final FetchImageUseCase _fetchImageUseCase;

  RandomImageFetchBloc(this._fetchImageUseCase) : super(RandomImageFetchState<ImageResponseModel>()) {
    on<FetchDataInitEvent>(_onFetchDataInit);
    on<FetchDataPaginationEvent>(_onFetchDataPagination);
    on<FetchDataTabPaginationEvent>(_onFetchDataTabPagination);
    on<StopDataFetchEvent>(_onStopDataFetch);
    on<FetchDataTabEvent>(_onFetchDataTab);
  }

  Future<void> _onFetchDataInit(FetchDataInitEvent event, Emitter<RandomImageFetchState<ImageResponseModel>> emit) async {
    try {
      emit(state.copyWith(event: event, state: state.loading));
      var res = await _fetchImageUseCase(params: ImageRequestModel(1, "random"));
      if(res.statusCode == HttpStatus.ok){
        log.d("Received Data is ${res.data}");
        ImageResponseModel model = ImageResponseModel.fromJson(res.data);
        log.d("Image length is ${model.photos?.length}");
        emit(state.copyWith(state: state.success, data: model));
      }
      else{
        emit(state.copyWith(state: state.failed));
      }
    } catch (error) {
      log.e("Error while data parse $error");
      emit(state.copyWith(state: state.failed, error: error.toString()));
    }
  }

  /// Handles pagination to fetch more data
  Future<void> _onFetchDataPagination(FetchDataPaginationEvent event, Emitter<RandomImageFetchState<ImageResponseModel>> emit) async {
    try {
      emit(state.addPaginationLoading(event: event));
      var res = await _fetchImageUseCase(params: ImageRequestModel(state.randomPageNo+1, "random"));
      if(res.statusCode == HttpStatus.ok){
        log.d("Received Data in pagination is ${res.data}");
        ImageResponseModel model = ImageResponseModel.fromJson(res.data);
        log.d("Image length in pagination is ${model.photos?.length}");
        emit(state.copyWith(
          state: state.success,
          randomPageNo: state.randomPageNo+1,
          data: state.data?.copyWith(
              photos: [...?state.data?.photos, ...?model.photos]
            )
          )
        );
      }
      else{
        emit(state.copyWith(state: state.failed));
      }
    } catch (error) {
      log.e("Error while data parse in pagination $error");
      emit(state.copyWith(state: state.failed, error: error.toString()));
    }
  }

  Future<void> _onFetchDataTab(FetchDataTabEvent event, Emitter<RandomImageFetchState<ImageResponseModel>> emit) async {
    try {
      var tabType = TabType.fromString(event.eventName);
      if(tabType.isRandomImage){
        emit(state.copyWith(tabType: tabType, eventName: event.eventName));
        return;
      }
      log.d("Event NAME is ${event.eventName}");
      emit(state.copyWith(state: state.loading, tabType: tabType, eventName: event.eventName.toLowerCase()));
      var res = await _fetchImageUseCase(params: ImageRequestModel(1, event.eventName.toLowerCase()));
      if(res.statusCode == HttpStatus.ok){
        log.d("Received Data in TabBar is ${res.data}");
        ImageResponseModel model = ImageResponseModel.fromJson(res.data);
        log.d("Image length in TabBar is ${model.photos?.length}");
        emit(state.copyWith(
            tabPageNumber: 1,
            otherTabModel: model,
            state: state.success,
          ),
        );
      }
      else{
        emit(state.copyWith(state: state.failed));
      }
    } catch (error) {
      log.e("Error while data parse tab bar $error");
      emit(state.copyWith(state: state.failed, error: error.toString()));
    }
  }


  Future<void> _onFetchDataTabPagination(FetchDataTabPaginationEvent event, Emitter<RandomImageFetchState<ImageResponseModel>> emit) async {
    try {
      log.d("Event Name is ${state.eventName}");
      emit(state.addPaginationLoading(event: event));
      var res = await _fetchImageUseCase(params: ImageRequestModel(state.tabPageNumber+1, state.eventName ?? "random"));
      if(res.statusCode == HttpStatus.ok){
        log.d("Received Data in pagination is ${res.data}");
        ImageResponseModel model = ImageResponseModel.fromJson(res.data);
        log.d("Image length in pagination is ${model.photos?.length} ${state.otherTabModel?.photos?.length}");
        emit(state.copyWith(
            state: state.success,
            tabPageNumber: state.tabPageNumber+1,
            otherTabModel: state.otherTabModel?.copyWith(
                photos: [...?state.otherTabModel?.photos, ...?model.photos]
            )
        )
        );
      }
      else{
        emit(state.copyWith(state: state.failed));
      }
    } catch (error) {
      log.e("Error while data parse in pagination $error");
      emit(state.copyWith(state: state.failed, error: error.toString()));
    }
  }

  /// Handles stopping data fetch (if applicable)
  void _onStopDataFetch(
    StopDataFetchEvent event,
    Emitter<RandomImageFetchState<ImageResponseModel>> emit
  ) {
    emit(state.copyWith(event: event));
  }

}
