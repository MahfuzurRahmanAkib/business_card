import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../data/app_colors.dart';
import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          SizedBox(
            height: 536.h,
            child: OnBoardingSlider(
              hasFloatingButton: false,
              headerBackgroundColor: AppColors.white_1,
              pageBackgroundColor: AppColors.white_1,
              skipTextButton: GestureDetector(
                onTap: () {
                  controller.goToLogin();
                },
                child: CommonText(
                  text: "Skip",
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColors.purple_1,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  controller.goToLogin();
                },
                child: CommonText(
                  text: "Skip",
                  size: 16.sp,
                  weight: FontWeight.w500,
                  color: AppColors.purple_1,
                ),
              ),
              background: [
                Container(
                  height: 303.h,
                  width: 326.w,
                  margin: EdgeInsets.only(top: 80.r),
                  child: Image.asset(
                    'assets/images/on_board/on1.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  height: 303.h,
                  width: 326.w,
                  margin: EdgeInsets.only(top: 80.r),
                  child: Image.asset(
                    'assets/images/on_board/on2.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  height: 303.h,
                  width: 326.w,
                  margin: EdgeInsets.only(top: 80.r),
                  child: Image.asset(
                    'assets/images/on_board/on3.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
              centerBackground: true,
              totalPage: 3,
              speed: 1,
              pageBodies: [
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20.r, right: 20.r),
              width: Get.width,
              height: 276.h,
              color: AppColors.white_1,
              child: Column(
                children: [
                  CommonText(
                    text: "There are many variations of passages of Lorem",
                    align: TextAlign.center,
                    color: AppColors.black_3,
                    size: 20.sp,
                    weight: FontWeight.w500,
                    height: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CommonText(
                    text:
                        "It is a long established fact that a reader will be distracted by the readable content.",
                    align: TextAlign.center,
                    color: AppColors.gray_3,
                    size: 14.sp,
                    weight: FontWeight.w500,
                    height: 1,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(375.w, 48.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.goToCreate();
                    },
                    child: CommonText(
                      text: "Create Account",
                      size: 16.sp,
                      weight: FontWeight.w500,
                      color: AppColors.white_1,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(375.w, 48.h),
                      backgroundColor: AppColors.white_5,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.goToLogin();
                    },
                    child: CommonText(
                      text: "Sign In",
                      size: 16.sp,
                      weight: FontWeight.w500,
                      color: AppColors.purple_1,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
