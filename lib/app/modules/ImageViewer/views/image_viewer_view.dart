import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customText.dart';

import '../controllers/image_viewer_controller.dart';

class ImageViewerView extends GetView<ImageViewerController> {
  const ImageViewerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: "Images",
            color: Colors.white,
            size: 27,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF24243E),
        ),
        backgroundColor: const Color(0xFF24243E),
        body: Center(
          child: Image.network(
            controller.fileUrl,
            fit: BoxFit.contain,
          ),
        ));
  }
}
