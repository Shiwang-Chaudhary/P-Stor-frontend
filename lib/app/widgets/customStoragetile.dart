import 'package:flutter/material.dart';
import 'package:p_stor/app/widgets/customText.dart';

class CustomStorageTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;
  final String percent;
  final Color? iconColor;
  const CustomStorageTile({super.key,
  required this.title,
  required this.icon,
  required this.data,
  required this.percent,
  this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
                leading: Icon(icon,color:iconColor ?? Colors.blue,size: 30,),
                title: CustomText(text: title,size: 18,color: Colors.white,),
                subtitle: CustomText(text: "${data}",size: 15,color: Colors.white,),
                trailing: CustomText(text: "${percent}%",size: 18,color: Colors.white,),
              );
  }
}