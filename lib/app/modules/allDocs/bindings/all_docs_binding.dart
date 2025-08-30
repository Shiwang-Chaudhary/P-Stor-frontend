import 'package:get/get.dart';

import '../controllers/all_docs_controller.dart';

class AllDocsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllDocsController>(
      () => AllDocsController(),
    );
  }
}
