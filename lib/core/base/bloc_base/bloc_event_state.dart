


import 'package:wall_paper_app/core/base/bloc_base/bloc_event.dart';

enum BlocState {
  none,
  loading,
  noInternet,
  success,
  failed;
}

class BlocEventState<T> {
  final BlocState state;
  final BlocEvent? event;
  final T? data;
  final int? statusCode;
  final String? error;

  const BlocEventState({
    required this.state,
    this.event,
    this.data,
    this.statusCode,
    this.error
  });

  BlocState get none  => BlocState.none;
  BlocState get loading => BlocState.loading;
  BlocState get success => BlocState.success;
  BlocState get failed => BlocState.failed;
  BlocState get noInternet => BlocState.noInternet;
  bool get isNone => state == none;
  bool get isLoading => state == loading;
  bool get isSuccess => state == success;
  bool get isFailed => state == failed;
  bool get isNoInternet => state == noInternet;

  BlocEventState clear() => const BlocEventState(state: BlocState.none);
}