import 'package:get/get.dart';
import 'package:p_stor/app/modules/homePage/controllers/home_page_controller.dart';
import 'package:p_stor/app/modules/profile/controllers/profile_controller.dart';
import 'package:p_stor/app/modules/settings/controllers/settings_controller.dart';
import 'package:p_stor/app/modules/storageDetails/controllers/storage_details_controller.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<StorageDetailsController>(
      () => StorageDetailsController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
