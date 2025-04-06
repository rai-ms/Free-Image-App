part of 'random_image_fetch_bloc.dart';

sealed class RandomImageFetchEvent extends BlocEvent{}

class FetchDataInitEvent extends RandomImageFetchEvent{}

class FetchDataPaginationEvent extends RandomImageFetchEvent{
  FetchDataPaginationEvent();
}

class FetchDataTabEvent extends RandomImageFetchEvent{
  final int pageNo;
  final String eventName;
  FetchDataTabEvent({this.pageNo = 1, required this.eventName});
}

class FetchDataTabPaginationEvent extends RandomImageFetchEvent{
  final int pageNo;
  FetchDataTabPaginationEvent({this.pageNo = 1});
}

class BackToRandomList extends RandomImageFetchEvent{}

class StopDataFetchEvent extends RandomImageFetchEvent{}
