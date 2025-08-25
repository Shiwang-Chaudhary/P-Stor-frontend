import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/modules/home/home_controller.dart';
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:p_stor/app/widgets/bgContainer.dart';
import 'package:p_stor/app/widgets/customLargebutton.dart';
import 'package:p_stor/app/widgets/customText.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: BgContainer(
            body: Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
       //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(height: 150,
            "https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/9f6b03cb-c12d-4e20-88f1-e2a39ca7b324.png"
            //"https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/f97bd4f4-c812-4607-9aa3-dec35851a54b.png"
             // "https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/8b5a821f-c279-4e56-a74e-e493a833c379.png"
              ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Welcome to ",
            size: 24,
            color: Colors.white,
            weight: FontWeight.w200,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomText(
            text: "P-STOR ",
            size: 40,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text:
                "Store, back up, and access files anywhere with P STOR’s ultra-smooth experience, secure encryption, and quick search. Share links instantly and stay organized without the clutter.",
            size: 15,
            maxLines: 4,
            color: Colors.white,
            weight: FontWeight.w400,
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomText(
            text: "Get started with P STOR today!",
            size: 20,
            color: Colors.white,
            weight: FontWeight.w500,
          ),
          const SizedBox(
            height: 0,
          ),
          const CustomText(
            text: "Join for free",
            size: 20,
            color: Colors.white,
            weight: FontWeight.w500,
          ),
          const SizedBox(height: 33,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child: CustomLargeButton(onTap: (){
              Get.toNamed(Routes.LOGIN);
            }, text: "LOGIN",textColor: Colors.blueAccent,buttonColor: Colors.white,)),
            const SizedBox(width: 20,),
            Expanded(child: CustomLargeButton(onTap: (){
              Get.toNamed(Routes.SIGNUP);
            }, text: "SIGNUP",textColor: Colors.blueAccent,buttonColor: Colors.white,)),
          ],)
        ],
      ),
    )));
  }
}
