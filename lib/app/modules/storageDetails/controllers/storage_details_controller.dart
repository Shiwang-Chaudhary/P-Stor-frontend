import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageDetailsController extends GetxController {
  final List imageFiles = [];
  final List audioFiles = [];
  final List docsFiles = [];
  final List videoFiles = [];
  int imageSize = 0;
  int videoSize = 0;
  int audioSize = 0;
  int docsSize = 0;
  int totalSize = 0;
  int availableSpace = 2 * 1024 * 1024 * 1024;

  @override
  void onInit() {
    super.onInit();
    getAllFiles();
  }

  sizeConvertor(int size) {
    double KB = size / 1024;
    double MB = size / (1024 * 1024);
    double GB = size / (1024 * 1024 * 1024);
    if (GB < 1 || MB < 1024) {
      return "${MB.toStringAsFixed(2)}MB";
    } else if (MB < 1) {
      return "${KB.toStringAsFixed(2)}KB";
    } else if (GB > 1) {
      return "${GB.toStringAsFixed(2)}GB";
    }
  }

  double percentage(int catSize) {
    return double.parse(((catSize / availableSpace) * 100).toStringAsFixed(1));
  }

  Future<void> getAllFiles() async {
    try {
      log("GET ALL API HIT...");
      await Future.delayed(Duration(milliseconds: 100));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      const url = "http://192.168.1.5:3000/files/getAll";
      final uri = Uri.parse(url);

      final response = await http.post(uri, headers: {
        "Authorization": "Bearer $token",
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("Response body:$data");
        final videos = data["files"]["videos"] ?? [];
        final audios = data["files"]["audio"] ?? [];
        final images = data["files"]["images"] ?? [];
        final docs = data["files"]["documents"] ?? [];
        log("VIDEOS : $videos");
        log("AUDIOS : $audios");
        log("IMAGES : $images");
        log("DOC : $docs");
        // reset size so that next time API runs again, size gets to reset and shows update size
        videoSize = 0;
        audioSize = 0;
        imageSize = 0;
        docsSize = 0;
        totalSize = 0;

        videoFiles.assignAll(videos);
        imageFiles.assignAll(images);
        docsFiles.assignAll(docs);
        audioFiles.assignAll(audios);
        videoFiles.forEach(
            (video) => videoSize += (video["fileSize"] as int).toInt());
        audioFiles.forEach(
            (audio) => audioSize += (audio["fileSize"] as int).toInt());
        imageFiles.forEach(
            (image) => imageSize += (image["fileSize"] as int).toInt());
        docsFiles
            .forEach((doc) => docsSize += (doc["fileSize"] as int).toInt());
        totalSize = videoSize + audioSize + imageSize + docsSize;
        // isloading.value = false;
        log("VIDEOS size: $videoSize");
        log("AUDIOS size: $audioSize");
        log("IMAGES size: $imageSize");
        log("DOC size: $docsSize");
        log("TOTAL SIZE : $totalSize");
        update();
      } else {
        log("ERROR: ${response.statusCode}");
        // isloading.value = false;
      }
    } catch (e) {
      log("LOADING ERROR(VIDEOS): ${e.toString()}");
      // isloading.value = false;
    }
  }
}
