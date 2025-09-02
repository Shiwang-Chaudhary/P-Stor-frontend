import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/routes/app_pages.dart';
import 'package:p_stor/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
