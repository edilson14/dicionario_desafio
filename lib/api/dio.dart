import 'package:dio/dio.dart';

const String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

class DioServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  Future<dynamic> getWordInfo({required String word}) async {
    var wordInfo = await _dio.get(word);
    return wordInfo;
  }
}
