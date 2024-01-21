import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonNameTextField extends StatelessWidget {
  final TextEditingController? nameController;
  final String? hintText;
  final Color? hintColor;

  const CommonNameTextField({
    super.key,
    this.nameController,
    this.hintText,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        fillColor: AppColors.white_1,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.r),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.black),
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: Colors.black),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
