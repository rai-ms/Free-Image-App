part of 'random_image_fetch_bloc.dart';

class RandomImageFetchState<ImageResponseModel> extends BlocEventState<ImageResponseModel> {
  final bool isPaginationLoading;

  const RandomImageFetchState({
    super.state = BlocState.none,
    super.data,
    super.error,
    super.event,
    super.statusCode,
    this.isPaginationLoading = false,
  });

  @override
  RandomImageFetchState clear() => const RandomImageFetchState();

  RandomImageFetchState<ImageResponseModel> copyWith({
    BlocState? state,
    ImageResponseModel? data,
    String? error,
    RandomImageFetchEvent? event,
    int? statusCode,
    bool isPaginationLoading = false,
  }) {
    return RandomImageFetchState<ImageResponseModel>(
      state: state ?? this.state,
      data: data ?? this.data,
      error: error ?? this.error,
      event: event ?? this.event,
      statusCode: statusCode ?? this.statusCode,
      isPaginationLoading: isPaginationLoading,
    );
  }

  RandomImageFetchState<ImageResponseModel> addPaginationLoading({required RandomImageFetchEvent event}) {
    return copyWith(
      event: event,
      isPaginationLoading: true,
    );
  }
}
