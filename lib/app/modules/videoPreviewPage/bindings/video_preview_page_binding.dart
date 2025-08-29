import 'package:get/get.dart';

import '../controllers/video_preview_page_controller.dart';

class VideoPreviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPreviewPageController>(
      () => VideoPreviewPageController(),
    );
  }
}
