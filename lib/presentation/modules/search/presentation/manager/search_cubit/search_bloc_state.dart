part of 'search_bloc.dart';

class SearchBlocState<ImageResponseModel> extends BlocEventState<ImageResponseModel> {

  final bool isPagination;
  final String? eventName;
  final int pageNo;

  SearchBlocState({
    super.state = BlocState.none,
    super.data,
    super.error,
    super.event,
    super.statusCode,
    this.isPagination = false,
    this.eventName,
    this.pageNo = 1,
  });

  @override
  SearchBlocState<ImageResponseModel> clear() => SearchBlocState<ImageResponseModel>();

  SearchBlocState<ImageResponseModel> copyWith({
    BlocState? state,
    BlocEvent? event,
    ImageResponseModel? data,
    int? statusCode,
    int? pageNo,
    String? error,
    String? eventName,
    bool isPagination = false,
  }){
    return SearchBlocState<ImageResponseModel>(
      event: event ?? this.event,
      state: state ?? this.state,
      data: data ?? this.data,
      eventName: eventName ?? this.eventName,
      error: error ?? this.error,
      pageNo: pageNo ?? this.pageNo,
      statusCode: statusCode ?? this.statusCode,
      isPagination: isPagination
    );
  }
}