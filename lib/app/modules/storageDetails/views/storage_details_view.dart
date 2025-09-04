import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customStoragetile.dart';
import 'package:p_stor/app/widgets/customText.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/storage_details_controller.dart';

class StorageDetailsView extends GetView<StorageDetailsController> {
  const StorageDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24243E),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GetBuilder<StorageDetailsController>(
            builder: (controller) {
              final imageSize = controller.imageSize;
              final videoSize = controller.videoSize;
              final audioSize = controller.audioSize;
              final docSize = controller.docsSize;
              final totalSize = controller.totalSize;
              final availableSpace = controller.sizeConvertor(controller.availableSpace);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: const Color(0xFF24243E),
                    title: const CustomText(
                      text: "Storage Details",
                      color: Colors.white,
                      size: 27,
                      weight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CircularPercentIndicator(
                        radius: 60.0, // 64px diameter
                        lineWidth: 20.0, // stroke thickness
                        percent: ((controller.percentage(totalSize))/100),
                        backgroundColor: const Color(0xFF484A5B), // dark grey ring
                        progressColor: const Color(0xFF1EA0FF), // blue progress
                        circularStrokeCap: CircularStrokeCap.round, // rounded ends
                        animation: true,
                        animationDuration: 1000,
                        center: CustomText(
                          text: '${controller.percentage(totalSize)}%',
                          color: Colors.white,
                          size: 20,
                          weight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   CustomText(
                    text: "Used:  ${controller.sizeConvertor(totalSize)}",
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Available:  $availableSpace",
                    color: Colors.white,
                    size: 20,
                    weight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(
                    text: "Storage Breakdown",
                    size: 23,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   CustomStorageTile(
                      title: "Documents",
                      icon: Icons.file_copy,
                      data: controller.sizeConvertor(docSize),
                      percent: (controller.percentage(docSize)).toStringAsFixed(2)),
                   CustomStorageTile(
                      title: "Images",
                      icon: Icons.image,
                      iconColor: Colors.green,
                      data: controller.sizeConvertor(imageSize),
                      percent: (controller.percentage(imageSize)).toStringAsFixed(2)),
                   CustomStorageTile(
                      title: "Videos",
                      icon: Icons.video_file,
                      iconColor: Colors.pinkAccent,
                      data: controller.sizeConvertor(videoSize),
                      percent: (controller.percentage(videoSize)).toStringAsFixed(2)),
                   CustomStorageTile(
                      title: "Audios",
                      icon: Icons.music_note,
                      iconColor: Colors.red,
                      data: controller.sizeConvertor(audioSize),
                      percent: (controller.percentage(audioSize)).toStringAsFixed(2)),
                ],
              );
            }
          ),
        ));
  }
}
