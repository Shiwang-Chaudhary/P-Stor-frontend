import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p_stor/app/routes/app_routes.dart';

class SignupController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future signUp() async {
    try {
      log("SIGNUP API HIT.........");
      const url = "http://192.168.1.5:3000/api/users/register";
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": nameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passController.text.trim(),
        }),
      );

      log("SignUp status code:${response.statusCode}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200||response.statusCode == 201 ) {
        // final token = data["token"];
        // final name = data["username"];
        // final email = data["email"];
        // log("SignUp body:$data");
        // log("TOKEN:$token");
        // log("name:$name");
        // log("email:$email");

        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString("token", token);
        // await prefs.setString("name", name);
        // await prefs.setString("email", email);
        Get.snackbar("SignUp", data["message"]);
        //Get.offAll(() => Scaffold(body: Center(child: Text("Logged in OK"))));

        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("SignUp Failed", data["message"] ?? "Unknown error");
      }
    } catch (e) {
      log("SignUp error:$e");
      Get.snackbar("Error", e.toString());
    }
  }
}
