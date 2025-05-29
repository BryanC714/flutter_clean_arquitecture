import 'package:dio/dio.dart';

//Errores del protocolo http
class ApiError {
  final String message;
  final int? statusCode;

  ApiError(this.message, {this.statusCode});
  factory ApiError.fromDioError(dynamic error) {
    if (error is DioException) {
      return ApiError(
        error.response?.data['message'] ?? 'Ha ocurrido un error inesperado',
        statusCode: error.response?.statusCode,
      );
    }
    return ApiError('Error Desconocido');
  }
  @override
  String toString() => 'Api Error: $message(status: $statusCode)';
}
