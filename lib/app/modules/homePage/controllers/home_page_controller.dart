import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var isOpeningFile = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRecentFiles();
  }

  final RxList files = [].obs;
  //List pickedFiles = [];
  Future<void> pickMultipleFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      uploadFiles(result.files);
    } else {
      print("User canceled the picker.");
    }
  }

  Future getRecentFiles() async {
    log("GET RECENT FILES API HIT............");
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      const url = "http://192.168.1.5:3000/files/recentFiles";
      final uri = Uri.parse(url);
      final response =
          await http.post(uri, headers: {"Authorization": "Bearer $token"});
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final List fetchedFiles = data["files"];
        // files.clear(); //  old data htane k liye
        files.assignAll(fetchedFiles); // new data daalne k liye
        log("FILES:$files");
        log("RecentFiles:$fetchedFiles");
      } else {
        log("RecentFilesAPI error:${data["message"]}");
      }
    } catch (e) {
      log("Error:${e.toString()}");
    }
  }

  Future<void> uploadFiles(List<PlatformFile> files) async {
    try {
      log("UPLOAD FILE API HIT............");

      // Get token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null) {
        log("No token found");
        Get.snackbar("Error", "Please login first");
        return;
      }

      const url = "http://192.168.1.5:3000/files/uploads";
      final uri = Uri.parse(url);

      // Create a multipart request
      final request = http.MultipartRequest("POST", uri);
      request.headers['Authorization'] = "Bearer $token";

      // Add each file to the request
      for (var file in files) {
        if (file.path != null) {
          request.files.add(await http.MultipartFile.fromPath(
            "files",
            file.path!,
          ));
        }
      }

      // Send request
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      log("Status code for upload Files:${response.statusCode}");
      if (response.statusCode == 200) {
        log("Upload Success: $responseBody");
        Get.snackbar("Success", "Files uploaded successfully");
        await getRecentFiles();
      } else {
        log("Upload Failed: ${response.statusCode} $responseBody");
        Get.snackbar("Error", "Upload failed");
      }
    } catch (e) {
      log("Upload error: $e");
      Get.snackbar("Error", e.toString());
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

        if (mimeType != null && mimeType.startsWith('video/')) {
          Get.toNamed(Routes.VIDEO_PREVIEW_PAGE, arguments: filePath);
        } else {
          await OpenFile.open(filePath);
        }
      } else {
        print("Failed to preview file: ${response.statusCode}");
      }
    } catch (e) {
      print("Error previewing file: $e");
    }
  }

  Future<void> openFile(String fileId) async {
    try {
      isOpeningFile.value = true;
      await previewFile(fileId);
    } catch (e) {
      print("Error opening file: $e");
    } finally {
      isOpeningFile.value = false;
    }
  }
}
