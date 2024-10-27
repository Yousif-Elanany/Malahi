import 'package:dio/dio.dart';
import '../errors/failure.dart';

class ApiService {
  final Dio _dio;

  ApiService(String baseUrl) : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  // Generic GET request
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data; // Return the data
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  // Generic POST request
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data; // Return the data
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  // Generic PUT request
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response.data; // Return the data
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  // Generic DELETE request
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response.data; // Return the data
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  // Handle Dio errors
  void _handleError(DioError e) {
    String message;
    if (e.response != null) {
      message = 'Error: ${e.response?.statusCode} - ${e.response?.data}';
    } else {
      message = 'Error: ${e.message}';
    }
    throw Failure(message);
  }
}
