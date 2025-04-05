part of 'random_image_fetch_bloc.dart';

sealed class RandomImageFetchEvent extends BlocEvent{}

class FetchDataInitEvent extends RandomImageFetchEvent{}

class FetchDataPaginationEvent extends RandomImageFetchEvent{
  final int pageNo;
  final String? eventName;
  FetchDataPaginationEvent(this.pageNo, {this.eventName});
}

class FetchDataTabEvent extends RandomImageFetchEvent{
  final int pageNo;
  final String eventName;
  FetchDataTabEvent({this.pageNo = 1, required this.eventName});
}

class StopDataFetchEvent extends RandomImageFetchEvent{}
