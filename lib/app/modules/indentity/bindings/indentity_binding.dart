import 'package:get/get.dart';

import '../controllers/indentity_controller.dart';

class IndentityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndentityController>(
      () => IndentityController(),
    );
  }
}
