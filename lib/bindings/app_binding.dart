import 'package:dicionario_desafio/services/database_services.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => DataBaseServices(),
    );
  }
}
