import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../data/api_endpoints.dart';
import '../../card/controllers/card_controller.dart';
import '../controllers/settings_controller.dart';
import '../settings_card_details.dart';
import '../tips_bottom_sheet.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CommonText(
          text: "Settings",
          size: 28.sp,
          weight: FontWeight.w700,
          color: AppColors.black_3,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.goToDetails();
              },
              child: Container(
                height: 77.h,
                width: 335.w,
                decoration: ShapeDecoration(
                  color: AppColors.white_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: const Color(0xff7c94b6),
                        backgroundImage: NetworkImage(
                          Get.find<CardController>().userImage.value,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white_1,
                              width: 3.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.r, bottom: 10.r, left: 15, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: Get.find<CardController>().userName.value,
                            size: 16.sp,
                            weight: FontWeight.w500,
                            color: AppColors.black_3,
                          ),
                          CommonText(
                            text: Get.find<CardController>().userEmail.value,
                            size: 12.sp,
                            weight: FontWeight.w400,
                            color: AppColors.gray_3,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 24.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(vertical: 16.r),
              child: CommonText(
                text: "Business Card",
                size: 18.sp,
                weight: FontWeight.w500,
                color: AppColors.black_3,
              ),
            ),
            Container(
              height: 286.h,
              width: 335.w,
              decoration: ShapeDecoration(
                color: AppColors.white_1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 375.h,
                            child: TipsBottomSheet(
                                controller, controller.activeIndex.value),
                          );
                        },
                      );
                    },
                    child: SettingsCardDetails(
                        text: "Show All Tips",
                        onTap: () {
                          controller.goToFeedback();
                        }),
                  ),
                  Container(
                      width: Get.width, height: 1.h, color: AppColors.white_7),
                  GestureDetector(
                    onTap: () {
                      controller.goToFeedback();
                    },
                    child: SettingsCardDetails(
                      text: "Send Feedback",
                      onTap: () {
                        controller.goToFeedback();
                      },
                    ),
                  ),
                  Container(
                      width: Get.width, height: 1.h, color: AppColors.white_7),
                  GestureDetector(
                    onTap: () {},
                    child: SettingsCardDetails(
                        text: "Contact Support",
                        onTap: () {
                          controller.goToFeedback();
                        }),
                  ),
                  Container(
                      width: Get.width, height: 1.h, color: AppColors.white_7),
                  GestureDetector(
                    onTap: () {},
                    child: SettingsCardDetails(
                        text: "Privacy Policy",
                        onTap: () {
                          controller.goToFeedback();
                        }),
                  ),
                  Container(
                      width: Get.width, height: 1.h, color: AppColors.white_7),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 46.h,
                        margin: EdgeInsets.only(left: 10.r, right: 10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CommonText(
                              text: "Version",
                              color: AppColors.gray_4,
                            ),
                            CommonText(
                              text: "1.0.1",
                              size: 12.sp,
                              color: AppColors.gray_3,
                            ),
                          ],
                        ),
                      )),
                  Container(
                      width: Get.width, height: 1.h, color: AppColors.white_7),
                  GestureDetector(
                    onTap: () {},
                    child: SettingsCardDetails(
                        text: "Check for Update",
                        onTap: () {
                          controller.goToFeedback();
                        }),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(vertical: 16.r),
              child: CommonText(
                text: "Preference",
                size: 18.sp,
                weight: FontWeight.w500,
                color: AppColors.black_3,
              ),
            ),
            Container(
              height: 50.h,
              width: 335.w,
              margin: EdgeInsets.only(bottom: 26.r),
              decoration: ShapeDecoration(
                color: AppColors.white_1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: SettingsCardDetails(
                  text: "Permissions",
                  onTap: () {
                    controller.goToFeedback();
                  }),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/settings/hrt.png",
                      height: 24.h,
                      width: 24.w,
                    ),
                    CommonText(
                      text: "  Loving Business Card ?",
                      color: AppColors.black_3,
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: CommonText(
                    text: "Leave A Review",
                    color: AppColors.purple_1,
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
