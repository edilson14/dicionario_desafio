import 'package:get/get.dart';

import '../controllers/controllers.dart';

class WordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioController());
  }
}
