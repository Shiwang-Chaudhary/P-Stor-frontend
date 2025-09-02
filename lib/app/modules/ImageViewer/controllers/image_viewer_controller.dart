import 'package:get/get.dart';

class ImageViewerController extends GetxController {
  String fileUrl = "";
  @override
  void onInit() {
    fileUrl = Get.arguments as String;
    super.onInit();
  }
}
