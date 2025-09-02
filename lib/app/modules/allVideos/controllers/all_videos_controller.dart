import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AllVideosController extends GetxController {
  var videoFiles = [].obs;
  var isloading = true.obs;

  // Map: videoUrl -> thumbnail bytes
  var thumbnails = <String, Uint8List?>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getAllVideos();
  }

  Future<void> getAllVideos() async {
    try {
      log("GET ALL API HIT......");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString("token");
      const url = "http://192.168.1.5:3000/files/getAll";
      final uri = Uri.parse(url);

      final response =
          await http.post(uri, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final videos = data["files"]["videos"];
        videoFiles.assignAll(videos);

        for (var video in videos) {
          final fileUrl = video["fileUrl"];
          _generateThumbnail(fileUrl);
        }

        isloading.value = false;
        log("VIDEOS: $videos");
      } else {
        log("ERROR: ${response.statusCode}");
        isloading.value = false;
      }
    } catch (e) {
      log("LOADING ERROR(VIDEOS): ${e.toString()}");
      isloading.value = false;
    }
  }

  Future<void> _generateThumbnail(String videoUrl) async {
    try {
      final thumb = await VideoThumbnail.thumbnailData(
        video: videoUrl,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 200,
        quality: 50,
      );
      thumbnails[videoUrl] = thumb;
      thumbnails.refresh(); // Notify UI to update
    } catch (e) {
      log("Thumbnail error for $videoUrl: $e");
    }
  }
}
