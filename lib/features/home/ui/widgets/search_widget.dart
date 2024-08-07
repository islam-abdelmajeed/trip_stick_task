import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripstick/core/themes/styles.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const SearchWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.text16Weight400Black,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          hintStyle: Styles.text16Weight400Black),
    );
  }
}
