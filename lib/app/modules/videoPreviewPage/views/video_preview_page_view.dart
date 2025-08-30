import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/video_preview_page_controller.dart';

class VideoPreviewPageView extends GetView<VideoPreviewPageController> {
  const VideoPreviewPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Preview")),
      body: Obx(() {
        if (!controller.isInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: AspectRatio(
            aspectRatio: controller.videoController.value.aspectRatio,
            child: VideoPlayer(controller.videoController),
          ),
        );
      }),
      floatingActionButton: Obx(() {
        if (!controller.isInitialized.value) return Container();
        return FloatingActionButton(
          onPressed: () {
            controller.videoController.value.isPlaying
                ? controller.videoController.pause()
                : controller.videoController.play();
          },
          child: Icon(controller.isPlaying.value
              ? Icons.pause
              : Icons.play_arrow),
        );
      }),
    );
  }
}
