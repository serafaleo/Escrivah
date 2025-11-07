import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract interface class DioManager {
  Future<Response<Object>> get(String url, {Map<String, dynamic>? queryParameters});
}

final class DioManagerImpl implements DioManager {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://escriva.org/pt-br',
      headers: <String, dynamic>{'Content-Type': 'application/json; charset=UTF-8'},
      responseType: ResponseType.json,
      sendTimeout: kDebugMode ? null : const Duration(seconds: 10),
      receiveTimeout: kDebugMode ? null : const Duration(seconds: 10),
      connectTimeout: kDebugMode ? null : const Duration(seconds: 10),
    ),
  );

  @override
  Future<Response<Object>> get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }
}
