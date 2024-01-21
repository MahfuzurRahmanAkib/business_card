import 'dart:ffi';
import 'dart:io';

import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../class/image_picker_edit.dart';
import '../../controllers/edit_controller.dart';
import '../design/edit_color_picker.dart';

class EditDisplaySection extends StatelessWidget {
  final EditController editController = Get.put(EditController());

  EditDisplaySection(
    EditController controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              /// Design
              Container(
                height: 223.h,
                width: Get.width,
                color: AppColors.white_1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.r, top: 10.r),
                      alignment: Alignment.topLeft,
                      child: CommonText(
                        text: 'Design',
                        color: const Color(0xFF333333),
                        weight: FontWeight.w700,
                        size: 20.sp,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                              height: 190.h,
                              width: Get.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: editController.cardStyleList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  bool isSelectedColor =
                                      editController.selectedColor.value ==
                                          index;
                                  bool isSelectedBox =
                                      editController.isSelectedBox.value ==
                                          index;
                                  return Obx(() {
                                    var cardStyle =
                                        editController.cardStyleImages;
                                    return GestureDetector(
                                      onTap: () {
                                        editController.isSelectedBox.value =
                                            index;
                                        isSelectedBox = editController
                                                .isSelectedBox.value ==
                                            index;
                                        isSelectedColor = editController
                                                .selectedColor.value ==
                                            index;
                                        editController.designIndex.value =
                                            index;
                                      },
                                      child: Container(
                                        height: 121.h,
                                        width: 110.w,
                                        margin: EdgeInsets.only(
                                          left: 10.r,
                                          right: 10.r,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5.r),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: editController
                                                      .isSelectedBox
                                                      .value ==
                                                      index
                                                      ? AppColors.black_6
                                                      : AppColors.white_1,
                                                  width: 2.w,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(10.r),
                                              ),
                                              child: Image.asset(
                                                cardStyle[index].imagePath ??
                                                    '',
                                                fit: BoxFit.fill,
                                                height: 101.h,
                                                color: editController
                                                        .selectedColorForGlobalColorChange
                                                        .value ??
                                                    Colors.black12,
                                                width: 90.w,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 10.r),
                                                child: CommonText(
                                                  text: editController
                                                          .cardStyleList[index]
                                                          .name ??
                                                      "",
                                                  color:
                                                      const Color(0xFF555555),
                                                  weight: FontWeight.w400,
                                                  size: 17.sp,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              /// Profile Images
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
                          color: const Color(0xFF333333),
                          weight: FontWeight.w700,
                          size: 20.sp,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            ImagePicekrForProfileImage(context, editController);
                          },
                          child: editController
                                  .profileImagePath.value.isNotEmpty
                              ? CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: const Color(0xff7c94b6),
                                  backgroundImage: FileImage(File(
                                      editController.profileImagePath.value)),
                                )
                              : Container(
                                  width: 335.w,
                                  height: 65.h,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF2F2F7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/image.svg",
                                        height: 28.h,
                                        width: 28.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.r, right: 5.r),
                                        child: CommonText(
                                          text: 'Add Profile Picture',
                                          color: const Color(0xFF777777),
                                          weight: FontWeight.w500,
                                          size: 16.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 16.r,
                                        color: const Color(0xFF777777),
                                      )
                                    ],
                                  ),
                                ))
                    ],
                  )),
              SizedBox(height: 8.h),

              /// Color
              Container(
                height: 116.h,
                width: 375.w,
                color: AppColors.white_1,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.r, top: 10.r),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: CommonText(
                              text: 'Color',
                              color: const Color(0xFF333333),
                              weight: FontWeight.w700,
                              size: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  editController.cardThemeColorList.length,
                              itemBuilder: (context, index) {
                                String? primaryColorCode = editController
                                    .cardThemeColorList[index].primaryColorCode;
                                Color? color = primaryColorCode != null
                                    ? editController
                                        .hexStringToColor(primaryColorCode)
                                    : Colors.transparent;
                                return EditColorPicker(
                                  index: index,
                                  id: editController
                                          .cardThemeColorList[index].id ??
                                      9,
                                  editController: editController,
                                  color: color ?? Colors.transparent,
                                  onTap: (selectedColor) {
                                    editController
                                        .selectedColorForGlobalColorChange
                                        .value = selectedColor;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              /// Logo Images
              Container(
                height: 145.h,
                width: 375.w,
                color: AppColors.white_1,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 20.r, top: 10.r, bottom: 16.r),
                      alignment: Alignment.topLeft,
                      child: CommonText(
                        text: 'Logo',
                        color: const Color(0xFF333333),
                        weight: FontWeight.w700,
                        size: 20.sp,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          ImagePicekrForLogoImage(context, editController);
                        },
                        child: editController.logoImagePath.value.isNotEmpty
                            ? CircleAvatar(
                                radius: 30.r,
                                backgroundColor: const Color(0xff7c94b6),
                                backgroundImage: FileImage(
                                    File(editController.logoImagePath.value)),
                              )
                            : Container(
                                width: 335.w,
                                height: 65.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF2F2F7),
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
                                      padding: EdgeInsets.only(
                                          left: 5.r, right: 5.r),
                                      child: CommonText(
                                        text: 'Add Logo',
                                        color: const Color(0xFF777777),
                                        weight: FontWeight.w500,
                                        size: 16.sp,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 16.r,
                                      color: const Color(0xFF777777),
                                    )
                                  ],
                                ),
                              ))
                  ],
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      }),
    );
  }
}
