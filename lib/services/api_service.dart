import 'package:dio/dio.dart';
import 'package:geexar/core/constants/app_consts.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConsts.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      return response;
     
    } on DioException catch (e) {
     throw Exception("API Error: ${e.response?.statusCode ?? 'Unknown'}");
    }
  }
}
