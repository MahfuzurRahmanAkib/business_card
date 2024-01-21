import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_wigets/text_box_heading_text.dart';

class SendMsgOnTabBar extends StatelessWidget {
  final BuildContext context;
  final CardController controller;

  const SendMsgOnTabBar(this.context, this.controller, {super.key});

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
                    decoration: InputDecoration(
                      hintText: "Name",
                      filled: true,
                      fillColor: AppColors.white_1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFAAAAAA),
                      ),
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
                      contentPadding: EdgeInsets.only(left: 10.r, top: 5.r),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),

            /// phone
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxHeadingText(text: "Phone Number"),
                SizedBox(
                  height: 40.h,
                  width: 335.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "000 000 000",
                      filled: true,
                      fillColor: AppColors.white_1,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black_1,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.r, top: 5.r),
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

            /// message
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBoxHeadingText(text: "Message"),
                SizedBox(
                  height: 75.h,
                  width: 335.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Write Your Message Here",
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                          color: AppColors.white_1,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.r, top: 5.r),
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
                  color:
                      controller.hexStringToColor(controller.cardColor.value) ??
                          AppColors.purple_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.hexStringToColor(
                        controller.cardColor.value) ?? AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Send Text",
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
