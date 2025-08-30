import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customText.dart';
import '../controllers/all_videos_controller.dart';

class AllVideosView extends GetView<AllVideosController> {
  const AllVideosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Videos",
          color: Colors.white,
          size: 27,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF24243E),
      ),
      backgroundColor: const Color(0xFF24243E),
      body: Obx(() {
        if (controller.isloading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }

        return GridView.builder(
          itemCount: controller.videoFiles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.2,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            final fileUrl = controller.videoFiles[index]["fileUrl"];
            final thumb = controller.thumbnails[fileUrl];

            return GestureDetector(
              onTap: () {
                // Navigate to video preview page
                // Get.toNamed(Routes.VIDEO_PREVIEW_PAGE, arguments: fileUrl);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color.fromRGBO(60, 60, 79, 1),
                ),
                child: thumb == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: Image.memory(
                              thumb,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}
