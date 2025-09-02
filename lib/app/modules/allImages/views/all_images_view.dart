import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customText.dart';

import '../controllers/all_images_controller.dart';

class AllImagesView extends GetView<AllImagesController> {
  const AllImagesView({super.key});
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
        body: Obx(() => controller.isloading == true.obs
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : GridView.builder(
                itemCount: controller.imagesFiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6, // vertical space between items
                  crossAxisSpacing: 6, // horizontal space between items
                  childAspectRatio: 1.2,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  final fileId = (controller.imagesFiles)[index]["_id"];
                  final fileUrl = (controller.imagesFiles)[index]["fileUrl"];

                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      // height: 150,
                      // width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color.fromRGBO(60, 60, 79, 1)),
                      child: Image.network(
                        fileUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                })));
  }
}
