import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassTextfield extends StatelessWidget {
  final TextEditingController controller;
  const PassTextfield({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
      // obscureText: !controller.isPasswordVisible.value,
      decoration: InputDecoration(
        filled: true,
        hintStyle: GoogleFonts.outfit(),
        hintText: "Enter your password",
        prefixIcon: const Icon(Icons.key,size: 30,color: Color.fromRGBO(54, 51, 136, 1),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(7)),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        suffixIcon: GestureDetector(
          onTap: () {}
          //controller.togglePasswordVisibility
          ,
          child: Icon(
            size: 20,
            // controller.isPasswordVisible.value
            //     ? Icons.visibility
            //:
            Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
