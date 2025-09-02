import 'package:get/get.dart';
import 'package:p_stor/app/modules/homePage/views/home_page_view.dart';
import 'package:p_stor/app/modules/profile/views/profile_view.dart';
import 'package:p_stor/app/modules/settings/views/settings_view.dart';
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
    selectedIndex.value = index;
  }
}
