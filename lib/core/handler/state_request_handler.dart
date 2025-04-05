import 'package:dio/dio.dart';
class StateRequestHandler<T> {
  StateRequestHandler();
  Future<T?> call({
    required Future<T?> Function() apiCall,
    required Function(dynamic) dioError,
    required Function(dynamic) error,
  }) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      dioError(e);
    } catch (e) {
      error(e);
    }
    return null;
  }
}
