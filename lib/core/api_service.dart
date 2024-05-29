import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://jsonplaceholder.typicode.com/";

  ApiService(this._dio);

  get({required String endPoint}) async {
    Response response = await _dio.get("$baseUrl$endPoint");
    return response.data;
  }

  post({required String endPoint, Map<String, dynamic>? body}) async {
    Response response = await _dio.post("$baseUrl$endPoint", data: body);
    return response.data;
  }

  delete({required String endPoint}) async {
    Response response = await _dio.delete("$baseUrl$endPoint");
    return response.data;
  }
}
