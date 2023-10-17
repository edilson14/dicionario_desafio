import 'package:get/get.dart';

import 'package:dicionario_desafio/services/services.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => DataBaseServices(),
    );
  }
}
