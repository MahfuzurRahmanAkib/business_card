import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/modules/edit/controllers/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../../../data/api_endpoints.dart';

class EditBottomSheet extends StatelessWidget {
  final EditController? editController;
  final String link;

  const EditBottomSheet({super.key, required this.link, this.editController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425.h,
      width: Get.width,
      decoration: ShapeDecoration(
        color: AppColors.white_1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 56.w,
            height: 5.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.r, bottom: 10.r),
            decoration: ShapeDecoration(
              color: AppColors.gray_1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// image
              Image.network(
                ApiEndPoints.baseImageUrl + link,
                height: 60.h,
                width: 60.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Social Link"),
                  SizedBox(
                    height: 40.h,
                    width: 335.w,
                    child: TextFormField(
                      controller: editController?.socialUserNameController.value,
                      decoration: InputDecoration(
                        hintText: "Add Link Here",
                        fillColor: AppColors.white_1,
                        filled: true,
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: AppColors.gray_5,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r,top: 5.r),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1.w, color: AppColors.white_10),
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 1.w, color: AppColors.white_10),
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "User Name"),
                  SizedBox(
                    height: 40.h,
                    width: 335.w,
                    child: TextFormField(
                      controller: editController?.socialUserNameController.value,
                      decoration: InputDecoration(
                        hintText: "@usernamehere",
                        fillColor: AppColors.white_1,
                        filled: true,
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: AppColors.gray_5,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r,top: 5.r),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.w, color: AppColors.white_10),
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.w, color: AppColors.white_10),
                          borderRadius: BorderRadius.circular(5.0.r),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 335.w,
              height: 52.h,
              margin: EdgeInsets.symmetric(vertical: 5.r),
              decoration: ShapeDecoration(
                color: AppColors.purple_1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.purple_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Center(
                    child: CommonText(
                  text: "Go Back",
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColors.white_1,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
