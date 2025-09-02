import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final bool isPassword;
  final bool showSuffixIcon;
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    required this.showSuffixIcon,
    required this.hintText,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isPasswordVisible : false,
      style: GoogleFonts.outfit(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: showSuffixIcon
            ? IconButton(
                onPressed: onTogglePasswordVisibility,
                icon: Icon(
                  isPasswordVisible
                      ? suffixIcon
                      : Icons.visibility_off_outlined,
                  size: 24,
                ),
              )
            : null,
        prefixIcon: Icon(
          prefixIcon,
          color: const Color.fromRGBO(54, 51, 136, 1),
          size: 30,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.outfit(fontSize: 16, color: Colors.black),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
    );
  }
}
