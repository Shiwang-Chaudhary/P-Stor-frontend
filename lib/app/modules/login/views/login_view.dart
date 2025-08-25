import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:p_stor/app/widgets/EmailTextField.dart';
import 'package:p_stor/app/widgets/PassTextfield.dart';
import 'package:p_stor/app/widgets/bgContainer.dart';
import 'package:p_stor/app/widgets/customLargebutton.dart';
import 'package:p_stor/app/widgets/customText.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BgContainer(
            body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
                height: 150,
                "https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/9f6b03cb-c12d-4e20-88f1-e2a39ca7b324.png"
                //"https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/f97bd4f4-c812-4607-9aa3-dec35851a54b.png"
                //"https://user-gen-media-assets.s3.amazonaws.com/gpt4o_images/8b5a821f-c279-4e56-a74e-e493a833c379.png"
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "Welcome back!",
            size: 34,
            color: Colors.white,
            weight: FontWeight.w400,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: "Enter details to login ",
            size: 20,
            color: Colors.white,
            weight: FontWeight.w300,
          ),
          const SizedBox(
            height: 20,
          ),
          EmailTextField(
            controller: controller.emailController,
          ),
          const SizedBox(
            height: 15,
          ),
          PassTextfield(
            controller: controller.passController,
          ),
          const SizedBox(
            height: 23,
          ),
          Center(
              child: SizedBox(
                  width: 140,
                  height: 60,
                  child: CustomLargeButton(
                      onTap: () {
                        controller.login();
                        //Get.toNamed(Routes.BOTTOM_NAV_BAR);
                      },
                      text: "LOGIN")))
        ],
      ),
    )));
  }
}
