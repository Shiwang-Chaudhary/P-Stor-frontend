import 'dart:developer';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    log("HOMEPAGE binding called..................................");
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
  }
}
