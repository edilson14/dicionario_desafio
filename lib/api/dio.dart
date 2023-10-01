import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../env/env.dart';

const String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

class DioServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  Future<dynamic> getWordInfo({required String word}) async {
    try {
      Response response = await _dio.get(word);

      print(response);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) Get.offNamed(AppRoutes.notFound);
      }
    }
  }
}
