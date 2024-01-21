import 'dart:io';

import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:business_card_api/app/modules/update/update_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_name_text_field.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black_3,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CommonText(
          text: "Update Profile",
          size: 28.sp,
          weight: FontWeight.w700,
          color: AppColors.black_3,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.only(left: 20.r, right: 20.r),
          child: Column(
            children: [
              Container(
                height: 145.h,
                width: 375.w,
                color: AppColors.white_1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.r, top: 10.r, bottom: 16.r, right: 20.r),
                      alignment: Alignment.topLeft,
                      child: CommonText(
                        text: 'Profile Photo',
                        color: AppColors.black_3,
                        weight: FontWeight.w700,
                        size: 20.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ImagePicekrForProfileImage(context, controller);
                      },
                      child: controller.profileImagePath.value.isNotEmpty
                          ? CircleAvatar(
                              radius: 35.r,
                              backgroundImage: FileImage(
                                  File(controller.profileImagePath.value)),
                            )
                          : Container(
                              width: 250.w,
                              height: 65.h,
                              decoration: ShapeDecoration(
                                color: AppColors.iconBackground_3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/image.svg",
                                    height: 28.h,
                                    width: 28.w,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.r, right: 5.r),
                                    child: CommonText(
                                      text: 'Add Profile Picture',
                                      color: AppColors.gray_3,
                                      weight: FontWeight.w500,
                                      size: 16.sp,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 16.r,
                                    color: AppColors.gray_3,
                                  )
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.r),
                    child: TextBoxHeadingText(text: "Full Name"),
                  ),
                  SizedBox(
                    width: 335.w,
                    height: 50.h,
                    child: CommonNameTextField(
                        nameController: controller.nameController.value),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 335.w,
                  height: 50.h,
                  margin: EdgeInsets.symmetric(vertical: 35.r),
                  decoration: ShapeDecoration(
                    color: AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.updateProfile(
                        controller.nameController.value.text,
                        controller.base64Image.value.toString(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: CommonText(
                        text: "Update Profile",
                        size: 16.sp,
                        weight: FontWeight.w500,
                        color: AppColors.white_1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
