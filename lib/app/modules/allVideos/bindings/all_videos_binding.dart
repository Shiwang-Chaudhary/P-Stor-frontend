import 'package:get/get.dart';

import '../controllers/all_videos_controller.dart';

class AllVideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllVideosController>(
      () => AllVideosController(),
    );
  }
}
