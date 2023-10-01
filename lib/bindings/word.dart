import 'package:dicionario_desafio/api/api.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';

class WordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioServices());
    Get.lazyPut(() => WordController());
    Get.lazyPut(() => AudioController());
  }
}
