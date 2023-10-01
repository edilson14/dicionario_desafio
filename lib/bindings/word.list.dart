import 'package:dicionario_desafio/controllers/controllers.dart';
import 'package:get/get.dart';

class WordsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordsController());
  }
}
