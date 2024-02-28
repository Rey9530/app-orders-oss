import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/environment.dart';

class BaseController extends GetConnect {
  final _apiurl = urlapi;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    httpClient.addRequestModifier(
      (dynamic request) {
        request.headers['Content-Type'] = 'application/json; charset=UTF-8';
        request.headers['Authorization'] = 'Bearer ${box.read("token")}';
        return request;
      },
    );
  }

  // Get request
  Future<Response> getData(String path) {
    Map<String, String>? headers = {
      'Authorization': 'Bearer ${box.read("token")}'
    };
    return get('$_apiurl/$path', headers: headers);
  }

  // Post request
  Future<Response> postData(String path, dynamic body) {
    Map<String, String>? headers = {
      'Authorization': 'Bearer ${box.read("token")}'
    };
    return post('$_apiurl/$path', body, headers: headers);
  }

  // Put request
  Future<Response> putData(String path, dynamic body) {
    Map<String, String>? headers = {
      'Authorization': 'Bearer ${box.read("token")}'
    };
    return put('$_apiurl/$path', body, headers: headers);
  }

  // Put request
  Future<Response> deleteData(String path, dynamic body) => delete(
        '$_apiurl/$path',
      );
}
