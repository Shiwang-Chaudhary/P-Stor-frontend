import 'dart:developer';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    log("LOGIN BINDING CALLED....................");
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
