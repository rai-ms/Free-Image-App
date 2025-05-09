

import 'package:dio/dio.dart';
import 'package:wall_paper_app/core/utils/status_code.dart';


/*
class responsible for removal of redundant status checks
and returning suitable api responses on basic of that..
This takes two callbacks :
1. apiCall() where we have to perform the dio api call with post, get etc..
2. refreshToken() handles with the refresh token logic
 */

class ApiHandler {
  const ApiHandler();
  Future<Response> dioHandler({
    required Future<Response> Function() apiCall,
    required Function? refreshTokenCallBack
  }) async {
    try{
      Response res = await apiCall();
      return res;
    } on DioException catch(e){
      if(e.response?.statusCode == StatusCode.httpUnAuthorized && refreshTokenCallBack != null){
        return refreshTokenCallBack();
      }
      else {
        rethrow;
      }
    }
  }
}



