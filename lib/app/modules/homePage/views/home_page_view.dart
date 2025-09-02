import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:p_stor/app/widgets/bgContainer.dart';
import 'package:p_stor/app/widgets/customContainer.dart';
import 'package:p_stor/app/widgets/customText.dart';
import 'package:p_stor/app/widgets/customTextfield.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgContainer(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "P - STOR",
                      color: Colors.white,
                      weight: FontWeight.bold,
                      size: 29,
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      controller: controller.searchController,
                      prefixIcon: Icons.search,
                      showSuffixIcon: false,
                      hintText: "Search files...",
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: "Folders",
                      color: Colors.white,
                      size: 23,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          ontap: () {
                            Get.toNamed(Routes.ALL_IMAGES);
                          },
                          icon: Icons.image,
                          text: "Images",
                          iconColor: Colors.green,
                        ),
                        CustomContainer(
                          ontap: () {
                            Get.toNamed(Routes.ALL_AUDIOS);
                          },
                          icon: Icons.music_note,
                          text: "Audio",
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          ontap: () async {
                            controller.isOpeningFile.value = true;
                            await Get.toNamed(Routes.ALL_VIDEOS);
                            controller.isOpeningFile.value = false;
                          },
                          icon: Icons.video_file,
                          text: "Video",
                          iconColor: Colors.pinkAccent,
                        ),
                        CustomContainer(
                          ontap: () {
                            Get.toNamed(Routes.ALL_DOCS);
                          },
                          icon: Icons.file_copy,
                          text: "Documents",
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: "Recent Files",
                      color: Colors.white,
                      size: 20,
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(height: 20),
                    Obx(() => controller.files.isEmpty
                        ? const Center(
                            child: Column(
                              children: [
                                CircularProgressIndicator(
                                    color: Colors.blueAccent),
                                SizedBox(height: 20),
                                CustomText(
                                  text: "No files found",
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1.2,
                            ),
                            itemCount: controller.files.length,
                            itemBuilder: (context, index) {
                              final List recentFiles = controller.files;
                              final String name =
                                  recentFiles[index]["fileName"];
                              final String fileId = recentFiles[index]["_id"];
                              final String mimeType =
                                  recentFiles[index]["mimeType"];

                              return SizedBox(
                                height: 100,
                                child: CustomContainer(
                                  textSize: 14,
                                  icon: mimeType.startsWith("video")
                                      ? Icons.video_file
                                      : Icons.file_copy,
                                  iconColor: Colors.white,
                                  text: name,
                                  ontap: () {
                                    controller.openFile(fileId);
                                  },
                                ),
                              );
                            },
                          ))
                  ],
                ),
              ),
            ),
          ),

          // === FULL SCREEN LOADING OVERLAY ===
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.pickMultipleFiles();
        },
        backgroundColor: const Color.fromARGB(255, 78, 78, 135),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
    );
  }
}
