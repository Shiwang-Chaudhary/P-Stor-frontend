import 'package:get/get.dart';
import 'package:p_stor/app/modules/homePage/views/home_page_view.dart';
import 'package:p_stor/app/modules/profile/views/profile_view.dart';
import 'package:p_stor/app/modules/settings/views/settings_view.dart';
import 'package:p_stor/app/modules/storageDetails/controllers/storage_details_controller.dart';
import 'package:p_stor/app/modules/storageDetails/views/storage_details_view.dart';

class BottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;
  final pages = [
    const HomePageView(),
    const StorageDetailsView(),
    const SettingsView(),
    const ProfileView()
  ];
  void barNavigation(int index) {
    //we do this because we need to call exisiting storagedetailscontroller and using that controller to update the list datas;
    if (index == 1) {
    final storageCtrl = Get.find<StorageDetailsController>();
    storageCtrl.getAllFiles(); 
  }
    selectedIndex.value = index;
  }
}
