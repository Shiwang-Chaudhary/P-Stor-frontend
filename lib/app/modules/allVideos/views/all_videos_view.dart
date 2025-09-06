import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        actions: [
          Obx(() => controller.selectedFile.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.showDeleteDialog(() {
                      controller.deleteFile(controller.selectedFile);
                    });
                  },
                  icon: const Icon(Icons.delete, color: Colors.white, size: 28),
                )
              : const SizedBox.shrink())
        ],
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
              childAspectRatio: 1.15,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              //final fileUrl = controller.videoFiles[index]["fileUrl"];
              final fileId = controller.videoFiles[index]["_id"];
              final fileName = controller.videoFiles[index]["fileName"];
              //final thumb = controller.thumbnails[fileUrl];

              return GestureDetector(
                onTap: () {
                  if (controller.selectedFile.isNotEmpty) {
                    controller.onSelected(fileId); // toggle selection
                  } else {
                     controller.openFile(fileId);
                  }
                 
                },
                onLongPress: () {
                  controller.onSelected(fileId);
                },
                child: Obx(() {
                  final isSelected = controller.selectedFile.contains(fileId);
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: isSelected
                              ? const Color.fromRGBO(36, 36, 62, 1)
                              : const Color.fromRGBO(60, 60, 79, 1),
                          border: isSelected
                              ? Border.all(color: Colors.blue, width: 3)
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.video_file,
                                color: isSelected ? Colors.blue : Colors.white,
                                size: 40,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: fileName,
                                size: 14,
                                color: isSelected ? Colors.blue : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isSelected)
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 26,
                          ),
                        ),
                    ],
                  );
                }),
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
