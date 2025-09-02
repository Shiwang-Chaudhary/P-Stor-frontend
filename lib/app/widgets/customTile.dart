import 'package:flutter/material.dart';
import 'package:p_stor/app/widgets/customText.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final VoidCallback ontap;
  const CustomTile(
      {super.key,
      required this.icon,
      required this.text,
      required this.ontap,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ListTile(
        //contentPadding: const EdgeInsets.symmetric(),
        leading: Icon(
          icon,
          size: 35,
          color: iconColor ?? Colors.yellow,
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            text: text,
            color: Colors.white,
            size: 24,
            weight: FontWeight.w400,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
