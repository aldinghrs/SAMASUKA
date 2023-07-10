import 'package:get/get.dart';

import '../controllers/input_surat_controller.dart';

class InputSuratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputSuratController>(
      () => InputSuratController(),
    );
  }
}
