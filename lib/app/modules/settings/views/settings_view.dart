import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:p_stor/app/widgets/customText.dart';
import 'package:p_stor/app/widgets/customTile.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24243E),
      body: Column(
        children: [
          AppBar(
            title: const CustomText(
              text: "Settings",
              color: Colors.white,
              size: 29,
              weight: FontWeight.w500,
            ),
            backgroundColor: const Color(0xFF24243E),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTile(icon: Icons.key, ontap: () {}, text: "Change password"),
          CustomTile(
              icon: Icons.language,
              ontap: () {},
              iconColor: Colors.blue,
              text: "Change Language"),
          CustomTile(
              icon: Icons.diamond,
              ontap: () {},
              iconColor: Colors.purple,
              text: "Upgrade plan"),
          CustomTile(
              icon: Icons.group,
              ontap: () {},
              iconColor: Colors.red,
              text: "Multiple account"),
        ],
      ),
    );
  }
}
