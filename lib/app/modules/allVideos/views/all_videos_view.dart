import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:p_stor/app/widgets/customText.dart';
import '../controllers/all_videos_controller.dart';

class AllVideosView extends GetView<AllVideosController> {
  const AllVideosView({super.key});

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
      body: Stack(children: [
        Obx(() {
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
              //final fileUrl = controller.videoFiles[index]["fileUrl"];
              final fileId = controller.videoFiles[index]["_id"];
              final fileName = controller.videoFiles[index]["fileName"];
              //final thumb = controller.thumbnails[fileUrl];

              return GestureDetector(
                onTap: () {
                  controller.openFile(fileId);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color.fromRGBO(60, 60, 79, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.video_file,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        CustomText(
                          text: fileName,
                          size: 16,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  // child: thumb == null
                  //     ?
                  //     const Center(
                  //         child: CircularProgressIndicator(
                  //           strokeWidth: 2,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     : Stack(
                  //         fit: StackFit.expand,
                  //         children: [
                  //           ClipRRect(
                  //             borderRadius: BorderRadius.circular(9),
                  //             child: Image.memory(
                  //               thumb,
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //           const Align(
                  //             alignment: Alignment.center,
                  //             child: Icon(
                  //               Icons.play_circle_fill,
                  //               color: Colors.white,
                  //               size: 36,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                ),
              );
            },
          );
        }),
        Obx(() => controller.isOpeningFile.value
            ? Container(
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: "Opening file, Please wait...",
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "This might take a while for large files",
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink()),
      ]),
    );
  }
}
