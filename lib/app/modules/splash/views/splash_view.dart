import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/q.png",
            height: 150.h,
            width: 120.w,
          ),
          SizedBox(height: 20.h),
          Center(
            child: CommonText(
              text: "User's Business Card",
              size: 16.sp,
              weight: FontWeight.w600,
              color: AppColors.purple_1,
            ),
          )
        ],
      ),
    );
  }
}
