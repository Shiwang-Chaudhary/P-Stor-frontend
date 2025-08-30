import 'package:get/get.dart';

import '../modules/allAudios/bindings/all_audios_binding.dart';
import '../modules/allAudios/views/all_audios_view.dart';
import '../modules/allDocs/bindings/all_docs_binding.dart';
import '../modules/allDocs/views/all_docs_view.dart';
import '../modules/allImages/bindings/all_images_binding.dart';
import '../modules/allImages/views/all_images_view.dart';
import '../modules/allVideos/bindings/all_videos_binding.dart';
import '../modules/allVideos/views/all_videos_view.dart';
import '../modules/bottomNavBar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottomNavBar/views/bottom_nav_bar_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/storageDetails/bindings/storage_details_binding.dart';
import '../modules/storageDetails/views/storage_details_view.dart';
import '../modules/videoPreviewPage/bindings/video_preview_page_binding.dart';
import '../modules/videoPreviewPage/views/video_preview_page_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.STORAGE_DETAILS,
      page: () => const StorageDetailsView(),
      binding: StorageDetailsBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.VIDEO_PREVIEW_PAGE,
      page: () => const VideoPreviewPageView(),
      binding: VideoPreviewPageBinding(),
    ),
    GetPage(
      name: Routes.ALL_IMAGES,
      page: () => const AllImagesView(),
      binding: AllImagesBinding(),
    ),
    GetPage(
      name: Routes.ALL_AUDIOS,
      page: () => const AllAudiosView(),
      binding: AllAudiosBinding(),
    ),
    GetPage(
      name: Routes.ALL_DOCS,
      page: () => const AllDocsView(),
      binding: AllDocsBinding(),
    ),
    GetPage(
      name: Routes.ALL_VIDEOS,
      page: () => const AllVideosView(),
      binding: AllVideosBinding(),
    ),
  ];
}
