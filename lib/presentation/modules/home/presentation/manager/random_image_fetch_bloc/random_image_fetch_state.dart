part of 'random_image_fetch_bloc.dart';

class RandomImageFetchState<ImageResponseModel> extends BlocEventState<ImageResponseModel> {
  final bool isPaginationLoading;
  final int randomPageNo;
  final int tabPageNumber;
  final ImageResponseModel? otherTabModel;
  final TabType tabType;
  final String? eventName;

  const RandomImageFetchState({
    super.state = BlocState.none,
    super.data,
    super.error,
    super.event,
    super.statusCode,
    this.isPaginationLoading = false,
    this.otherTabModel,
    this.eventName,
    this.randomPageNo = 1,
    this.tabPageNumber = 1,
    this.tabType = TabType.randomImage,
  });

  @override
  RandomImageFetchState clear() => const RandomImageFetchState();

  RandomImageFetchState<ImageResponseModel> copyWith({
    BlocState? state,
    ImageResponseModel? data,
    ImageResponseModel? otherTabModel,
    String? error,
    String? eventName,
    RandomImageFetchEvent? event,
    int? statusCode,
    int? randomPageNo,
    int? tabPageNumber,
    bool isPaginationLoading = false,
    TabType? tabType,
  }) {
    return RandomImageFetchState<ImageResponseModel>(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
      eventName: eventName ?? this.eventName,
      event: event ?? this.event,
      otherTabModel: otherTabModel ?? this.otherTabModel,
      statusCode: statusCode ?? this.statusCode,
      isPaginationLoading: isPaginationLoading,
      tabType: tabType ?? this.tabType,
      randomPageNo: randomPageNo ?? this.randomPageNo,
      tabPageNumber: tabPageNumber ?? this.tabPageNumber
    );
  }

  RandomImageFetchState<ImageResponseModel> addPaginationLoading({required RandomImageFetchEvent event}) {
    return copyWith(
      event: event,
      isPaginationLoading: true,
    );
  }
}

enum TabType{
  image,
  randomImage,
  randomVideo;

  bool get isImage => this == TabType.image;
  bool get isRandomImage => this == TabType.randomImage;
  bool get isRandomVideo => this == TabType.randomVideo;

  static TabType fromString(String value){
    switch(value.toLowerCase()){
      case "random":
        return TabType.randomImage;
      case "video":
        return TabType.randomVideo;
      default:
        return TabType.image;
    }
  }

}
