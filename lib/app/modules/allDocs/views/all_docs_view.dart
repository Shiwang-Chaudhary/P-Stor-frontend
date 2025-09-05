import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customText.dart';

import '../controllers/all_docs_controller.dart';

class AllDocsView extends GetView<AllDocsController> {
  const AllDocsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Documents",
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
      body: Obx(() {
        if (controller.isloading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }

        return controller.isloading.value == true
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : GridView.builder(
                itemCount: controller.docFiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1.2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  final name = controller.docFiles[index]["fileName"];
                  final fileId = controller.docFiles[index]["_id"];

                  return GestureDetector(
                    onTap: () {
                      if (controller.selectedFile.isNotEmpty) {
                        controller.onSelected(fileId); // toggle selection
                      }else{
                      controller.previewFile(fileId);
                      }
                    },
                    onLongPress: () {
                      controller.onSelected(fileId); // toggle selection
                    },
                    child: Obx(() {
                      final isSelected =
                          controller.selectedFile.contains(fileId);
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color:
                                        isSelected ? Colors.blue : Colors.red,
                                    size: 50,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    text: name,
                                    color:
                                        isSelected ? Colors.blue : Colors.white,
                                    size: 16,
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
                });
      }),
    );
  }
}
