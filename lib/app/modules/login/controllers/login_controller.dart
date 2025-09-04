import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p_stor/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future login() async {
    try {
      log("LOGIN API HIT.........");
      const url = "http://192.168.1.5:3000/api/users/login";
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "password": passController.text.trim(),
        }),
      );

      log("Login status code:${response.statusCode}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = data["token"];
        final name = data["username"];
        final email = data["email"];
        log("Login body:$data");
        log("TOKEN:$token");
        log("name:$name");
        log("email:$email");

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
        await prefs.setString("name", name);
        await prefs.setString("email", email);
        Get.snackbar("Login", data["message"]);
        //Get.offAll(() => Scaffold(body: Center(child: Text("Logged in OK"))));

        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        Get.snackbar("Login Failed", data["message"] ?? "Unknown error");
      }
    } catch (e) {
      log("Login error:$e");
      Get.snackbar("Error", e.toString());
    }
  }
}
