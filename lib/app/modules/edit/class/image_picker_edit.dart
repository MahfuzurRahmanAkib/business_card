import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:business_card_api/app/modules/edit/controllers/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void ImagePickerEdit(BuildContext context, EditController controller) {
  ImagePicekrForProfileImage(context, controller);
  ImagePicekrForLogoImage(context, controller);
}

Future<dynamic> ImagePicekrForProfileImage(
    BuildContext context, EditController controller) {
  return showModalBottomSheet(
      backgroundColor: AppColors.gray_5,
      context: context,
      builder: (Builder) {
        return SizedBox(
          height: 200.h,
          width: Get.width,
          child: Column(
            children: [
              Container(
                height: 25.h,
                width: Get.width,
                color: AppColors.black_3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 35.w,
                      height: 5.h,
                      color: AppColors.gray_5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          controller.getProfileImageFromCamera();
                          controller.base64ProfileImage.value.toString();
                        },
                        child: Icon(
                          Icons.camera_alt,
                          size: 50.r,
                          color: AppColors.white_1,
                        ),
                      ),
                      CommonText(
                        text: "Camera",
                        size: 18.sp,
                        color: AppColors.white_1,
                        align: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          controller.getProfileImageFromGallery();
                          controller.base64ProfileImage.value.toString();
                        },
                        child: Icon(
                          Icons.image,
                          size: 50.r,
                          color: AppColors.white_1,
                        ),
                      ),
                      CommonText(
                        text: "Gallery",
                        size: 18.sp,
                        color: AppColors.white_1,
                        align: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

Future<dynamic> ImagePicekrForLogoImage(
    BuildContext context, EditController controller) {
  return showModalBottomSheet(
    backgroundColor: AppColors.gray_5,
    context: context,
    builder: (Builder) {
      return SizedBox(
        height: 200.h,
        width: Get.width,
        child: Column(
          children: [
            Container(
              height: 25.h,
              width: Get.width,
              color: AppColors.black_3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 35.w,
                    height: 5.h,
                    color: AppColors.gray_5,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        controller.getLogoImageFromCamera();
                        controller.base64LogoImage.value.toString();
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 50.r,
                        color: AppColors.white_1,
                      ),
                    ),
                    CommonText(
                      text: "Camera",
                      size: 18.sp,
                      color: AppColors.white_1,
                      align: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        controller.getLogoImageFromGallery();
                        controller.base64LogoImage.value.toString();
                      },
                      child: Icon(
                        Icons.image,
                        size: 50.r,
                        color: AppColors.white_1,
                      ),
                    ),
                    CommonText(
                      text: "Gallery",
                      size: 18.sp,
                      color: AppColors.white_1,
                      align: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
