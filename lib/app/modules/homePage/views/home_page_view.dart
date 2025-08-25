import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: BgContainer(
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
            const SizedBox(
              height: 20,
            ),
            CustomTextfield(
                controller: controller.searchController,
                prefixIcon: Icons.search,
                showSuffixIcon: false,
                hintText: "Search files..."),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Folders",
              color: Colors.white,
              size: 23,
              weight: FontWeight.w500,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  ontap: () {},
                  icon: Icons.image,
                  text: "Images",
                  iconColor: Colors.green,
                ),
                //SizedBox(width: 20,),
                CustomContainer(
                  ontap: () {},
                  icon: Icons.music_note,
                  text: "Audio",
                  iconColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  ontap: () {},
                  icon: Icons.video_file,
                  text: "Video",
                  iconColor: Colors.pinkAccent,
                ),
                //SizedBox(width: 20,),
                CustomContainer(
                  ontap: () {},
                  icon: Icons.file_copy,
                  text: "Documents",
                  iconColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Recent Files",
              color: Colors.white,
              size: 20,
              weight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                shrinkWrap: true, // let GridView only use the height it needs
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of columns
                  mainAxisSpacing: 14, // vertical space between items
                  crossAxisSpacing: 12, // horizontal space between items
                  childAspectRatio: 1.2, // width/height ratio of each item
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                 //final String name = controller.files[index]["fileName"];
                  return SizedBox(
                      height: 100,
                      child: CustomContainer(
                        icon: Icons.file_copy,
                        iconColor: Colors.white,
                        text: "File 1",
                        ontap: () {},
                      ));
                })
          ],
        ),
      ),
    )));
  }
}
