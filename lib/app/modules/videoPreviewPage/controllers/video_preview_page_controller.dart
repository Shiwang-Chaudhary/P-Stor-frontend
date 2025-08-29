import 'dart:io';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewPageController extends GetxController {
  
  // late VideoPlayerController videoController;
  // late String path;
  // @override
  // void onInit() {
  //   super.onInit();
  //   path = Get.arguments;
  //   initializePlayer();
  // }
  // Future initializePlayer()async{
  //   videoController = VideoPlayerController.file(File(path));
  //   await videoController.initialize();

  //   update();
  // }
  // @override
  // void dispose() {
  //   videoController.dispose();
    
  //   super.dispose();
  // }
late VideoPlayerController videoController;
  late String path;
  var isInitialized = false.obs; // reactive flag

  @override
  void onInit() {
    super.onInit();
    path = Get.arguments; // get file path from arguments
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoController = VideoPlayerController.file(File(path));
    await videoController.initialize();
    videoController.play(); // auto-play
    isInitialized.value = true; // notify UI
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}
