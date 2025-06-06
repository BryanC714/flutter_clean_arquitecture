import 'package:dio/dio.dart';
import '../error/api_error.dart';

class RemoteApiClient {
  //Inicializar el objeto luego despues
  late Dio _dio;
  //Inicializar el cliente
  static RemoteApiClient init() {
    var apiclient = RemoteApiClient._();
    return apiclient;
  }

  RemoteApiClient._() {
    BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(microseconds: 5000),
      receiveTimeout: const Duration(microseconds: 3000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) {
    try {
      return _dio.put(endpoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }

  Future<Response> update(String endpoint, {dynamic data}) {
    try {
      return _dio.patch(endpoint, data: data);
    } catch (e) {
      throw ApiError.fromDioError(e);
    }
  }
}
