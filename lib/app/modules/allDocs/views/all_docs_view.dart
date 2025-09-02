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
                      controller.previewFile(fileId);
                    },
                    child: Container(
                        // height: 150,
                        // width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: const Color.fromRGBO(60, 60, 79, 1)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Icon(Icons.picture_as_pdf,
                                  color: Colors.red, size: 50),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  text: name, color: Colors.white, size: 16)
                            ],
                          ),
                        )),
                  );
                });
      }),
    );
  }
}
