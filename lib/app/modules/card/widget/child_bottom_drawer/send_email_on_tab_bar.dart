import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_wigets/text_box_heading_text.dart';
import '../../controllers/card_controller.dart';

class SendEmailOnTabBar extends StatelessWidget {
  final BuildContext context;
  final CardController controller;

  const SendEmailOnTabBar(this.context, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20.r, left: 20.r, right: 20.r),
        width: 335.w,
        height: 350.h,
        child: Column(
          children: [
            /// name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxHeadingText(text: "Name"),
                SizedBox(
                  height: 40.h,
                  width: 335.w,
                  child: TextFormField(
                    controller: controller.nameController.value,
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      fillColor: AppColors.white_1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_1,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.r),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            ///number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxHeadingText(text: "Email Address"),
                SizedBox(
                  height: 40.h,
                  width: 335.w,
                  child: TextFormField(
                    controller: controller.emailController.value,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      filled: true,
                      fillColor: AppColors.white_1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_1,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.r),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            /// msg
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxHeadingText(text: "Message"),
                SizedBox(
                  height: 75.h,
                  width: 335.w,
                  child: TextFormField(
                    controller: controller.messageController.value,
                    decoration: InputDecoration(
                      hintText: "Write Your Message Here...",
                      filled: true,
                      fillColor: AppColors.white_1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_1,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.r),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            /// button
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 335.w,
                height: 48.h,
                margin: EdgeInsets.symmetric(vertical: 10.r),
                decoration: ShapeDecoration(
                  color: AppColors.purple_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.sendEmail(
                        controller.nameController.value.text,
                        controller.emailController.value.text,
                        controller.messageController.value.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller
                            .hexStringToColor(controller.cardColor.value) ??
                        AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Send Mail",
                      style: TextStyle(
                        color: AppColors.white_1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
