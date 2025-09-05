import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:p_stor/app/widgets/customText.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllImagesController extends GetxController {
  final RxList imagesFiles = [].obs;
  var selectedFile = [].obs;
  var isloading = true.obs;
  @override
  void onInit() {
    getAllImages();
    super.onInit();
  }

  Future getAllImages() async {
    try {
      log("GET ALL API HIT......");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      const url = "http://192.168.1.5:3000/files/getAll";
      final uri = Uri.parse(url);
      final response =
          await http.post(uri, headers: {"Authorization": "Bearer $token"});
      log("Images Status Code:${response.statusCode}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final images = data["files"]["images"];
        imagesFiles.assignAll(images);
        isloading.value = false;
        log("IMAGES:$images");
        log("RECEIVED ALL IMAGES");
      }
    } catch (e) {
      print("LOADING ERROR(IMAGES):${e.toString()}");
    }
  }

  Future previewFile(String fileId) async {
    log("PREVIEW API HIT.....");
    try {
      final url = "http://192.168.1.5:3000/files/preview/$fileId";
      //const url = "";
      final uri = Uri.parse(url);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      final response = await http.post(uri, headers: {
        "Authorization": "Bearer $token",
      });
      log("StatusCode for Previewing file:${response.statusCode}");
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final filePath = "${tempDir.path}/previewed_file";
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        final mimeType =
            lookupMimeType(filePath, headerBytes: response.bodyBytes);
        log("Detected mime type: $mimeType");

        // if (mimeType != null && mimeType.startsWith('video/')) {
        //   Get.toNamed(Routes.VIDEO_PREVIEW_PAGE, arguments: filePath);
        // } else {
        await OpenFile.open(filePath);
        //}
      } else {
        print("Failed to preview file: ${response.statusCode}");
      }
    } catch (e) {
      print("Error previewing file: $e");
    }
  }


onSelected(String fileId) {
    if (selectedFile.contains(fileId)) {
      selectedFile.remove(fileId);
      log("Selected File List: $selectedFile");
    } else {
      selectedFile.add(fileId);
      log("Selected File List: $selectedFile");
    }
  }

  Future deleteFile(List selectedFile) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      final url = "http://192.168.1.5:3000/files/delete/dummy";
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({"ids": selectedFile}));
      if (response.statusCode == 200) {
        log("DELETE RESPONSE: ${response.body}");
        this.selectedFile.clear();
        getAllImages();
      } else {
        log("DELETE ERROR: ${response.statusCode}");
      }
    } catch (e) {
      log("DELETE ERROR: ${e.toString()}");
    }
  }

  void showDeleteDialog(VoidCallback onConfirm) {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero, // remove default padding
      content: Column(
        children: [
          CustomText(
              text: "Delete File",
              color: Colors.red,
              size: 20,
              weight: FontWeight.bold),
          const SizedBox(height: 20),
          CustomText(
              text: "Are you sure you want to delete this file?",
              color: Colors.white,
              size: 13,
              weight: FontWeight.w400),
        ],
      ),
      radius: 15,
      textCancel: "Cancel",
      textConfirm: "Delete",
      backgroundColor: const Color(0xFF24243E),
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onCancel: () {},
      onConfirm: () {
        Get.back(); // close dialog
        onConfirm(); // perform delete
      },
    );
  }
}
