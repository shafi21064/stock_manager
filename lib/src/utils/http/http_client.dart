import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../local_storage/local_storage_keys.dart';
import '../local_storage/storage_utility.dart';

class AppHttpHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env["BASE_URL"]!, // Set your base URL here if applicable
      connectTimeout: const Duration(seconds: 5), // 5 seconds
      receiveTimeout: const Duration(seconds: 3), // 3 seconds
    ),
  );

  AppHttpHelper._(); // Private constructor to prevent instantiation

  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final String token = AppLocalStorage().readData(LocalStorageKeys.accessToken);
      final response = await _dio.get(
        endpoint,
        options: Options(headers: _buildHeaders(token)),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    try {
      final String token = AppLocalStorage().readData(LocalStorageKeys.accessToken);
      final response = await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: _buildHeaders(token)),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    try {
      final String token = AppLocalStorage().readData(LocalStorageKeys.accessToken);
      final response = await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: _buildHeaders(token)),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final String token = AppLocalStorage().readData(LocalStorageKeys.accessToken);
      final response = await _dio.delete(
        endpoint,
        options: Options(headers: _buildHeaders(token)),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  static Map<String, String> _buildHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static Map<String, dynamic> _handleResponse(Response response) {
    return response.data is Map<String, dynamic> ? response.data : {'success': false, 'data': response.data};
  }

  static Map<String, dynamic> _handleError(DioException error) {
    return {
      'success': false,
      'message': error.message,
      'data': error.response?.data,
    };
  }
}
