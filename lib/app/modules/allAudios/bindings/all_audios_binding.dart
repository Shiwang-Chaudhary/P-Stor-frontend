import 'package:get/get.dart';

import '../controllers/all_audios_controller.dart';

class AllAudiosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllAudiosController>(
      () => AllAudiosController(),
    );
  }
}
