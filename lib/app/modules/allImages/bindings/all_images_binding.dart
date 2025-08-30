import 'package:get/get.dart';

import '../controllers/all_images_controller.dart';

class AllImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllImagesController>(
      () => AllImagesController(),
    );
    print("AllImagesBinding dependencies() called");
    
  }
}
