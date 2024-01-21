import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ScanController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: CommonText(
          text: "Scan",
          size: 28.sp,
          weight: FontWeight.w700,
          color: AppColors.black_3,
        ),
      ),
      body: Container(
        color: AppColors.background,
        height: Get.height,
        child: Column(
          children: [
            Container(
              height: 160.h,
              width: 160.w,
              margin: EdgeInsets.only(top: 140.h),
              child: SvgPicture.asset("assets/images/frame.svg"),
            ),
            SizedBox(height: 24.h),
            Container(
              height: 90.h,
              margin: EdgeInsets.symmetric(horizontal: 25.r),
              child: CommonText(
                text:
                    "Take a picture of a paper business card and receive an accurate, human verified contact within 24 hours",
                size: 16.sp,
                align: TextAlign.center,
                weight: FontWeight.w400,
                color: AppColors.gray_3,
              ),
            ),
            SizedBox(
              height: 123.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 24.r),
                width: 335.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  color: AppColors.purple_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    controller.scanQrCode();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Center(
                    child: CommonText(
                      text: "Scan Now",
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
      ),
    );
  }
}
