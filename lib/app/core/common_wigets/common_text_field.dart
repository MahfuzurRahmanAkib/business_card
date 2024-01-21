import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonEmailTextField extends StatelessWidget {
  final TextEditingController emailController;

  const CommonEmailTextField({
    super.key,
    required this.emailController,
  });

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Null or Invalid Email Address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      autovalidateMode: AutovalidateMode.always,
      validator: validateEmail,
      decoration: InputDecoration(
        hintText: "Email Address",
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.r),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.red),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.red),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
