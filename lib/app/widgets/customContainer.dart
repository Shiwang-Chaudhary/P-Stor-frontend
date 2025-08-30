import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_stor/app/widgets/customText.dart';

class CustomContainer extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final String? text;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback ontap;
  const CustomContainer({super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.iconSize,
    required this.ontap
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
         height: 150,
         width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color.fromRGBO(60, 60, 79, 1)),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Column(
            children: [
              Icon(
              icon ??  Icons.folder,
                color:iconColor?? Colors.yellow,
                size: iconSize??55,
              ),
              const SizedBox(height: 8,),
               CustomText(text: text ??"Folder 1",maxLines: 1,color: Colors.white,weight: FontWeight.w400,size: 18,)
            ],
          ),
        ),
      ),
    );
  }
}
