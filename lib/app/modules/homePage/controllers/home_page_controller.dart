import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getRecentFiles();
  // }
  // final List files = [];
  // Future getRecentFiles()async{
  //   log("GET RECENT FILES API HIT............");
  //   try {
  //   const url = "http://192.168.1.12:3000/files/recentFiles";
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString("token");
  //   final uri = Uri.parse(url);
  //   final response = await http.post(uri,
  //   headers: {
  //     "Authorization" : "Bearer $token"
  //   }); 
  //   final data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     final List fetchedFiles = data["files"];
  //     files.addAll(fetchedFiles);
  //     log("FILES:$files");
  //     log("RecentFiles:$fetchedFiles");
  //   } else {
  //     log("RecentFilesAPI error:${data["message"]}");
  //   }
  //   } catch (e) {
  //     log("Error:${e.toString()}");
  //   }
    
  // }
}
