import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../env/env.dart';

const String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

class DioServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    ),
  );

  Future<dynamic> getWordInfo({required String word}) async {
    try {
      Response response = await _dio.get(word);

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        Get.back();

        Get.snackbar(
          'Time Out',
          "Conexão atingiu time-out verifique sua internet",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      if (e.response != null) {
        if (e.response?.statusCode == 404) Get.offNamed(AppRoutes.notFound);
      }
    }
  }
}
