import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../bottomNavBar/controllers/bottom_nav_bar_controller.dart';
import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CommonText(
              text: "Send Feedback",
              size: 28.sp,
              weight: FontWeight.w700,
              color: AppColors.black_3,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  size: 28.r, color: AppColors.black_6),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 220.h,
                  width: 335.w,
                  child: TextFormField(
                    controller: controller.feedbackController.value,
                    maxLines: 20,
                    decoration: InputDecoration(
                      hintText: "Write Your Feedback Here..",
                      hintStyle: const TextStyle(color: AppColors.gray_1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: AppColors.white_1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: AppColors.white_1),
                      ),
                      fillColor: AppColors.white_1,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.r),
                  height: 50.h,
                  width: 335.w,
                  decoration: ShapeDecoration(
                    color: AppColors.white_1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller
                          .createFeedback(
                          controller.feedbackController.value.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.purple_1,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: CommonText(
                      text: "Update Feedback",
                      size: 16.sp,
                      color: AppColors.white_1,
                      weight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.gray_1,
            unselectedItemColor: AppColors.gray_1,
            selectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: "SfMedium",
              fontWeight: FontWeight.w500,
              color: AppColors.purple_1,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "SfMedium",
              color: AppColors.purple_1,
            ),
            currentIndex: 3,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedFontSize: 14.sp,
            selectedFontSize: 14.sp,
            onTap: (index) {
              controller.selectedIndex.value = index;
              Get.find<BottomNavBarController>().cIndex.value = index;
              Get.back();
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/card_inactive.svg",
                  height: 28.h,
                  width: 38.w,
                ),
                label: "Cards",
                activeIcon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/card_active.svg",
                  height: 28.h,
                  width: 38.w,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/scan_inactive.svg",
                  height: 28.h,
                  width: 38.w,
                ),
                label: "Scan",
                activeIcon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/scan_active.svg",
                  height: 28.h,
                  width: 38.w,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/contact_inactive.svg",
                  height: 28.h,
                  width: 38.w,
                ),
                label: "Contact",
                activeIcon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/contact_active.svg",
                  height: 28.h,
                  width: 38.w,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/settings_inactive.svg",
                  height: 28.h,
                  width: 38.w,
                ),
                label: "Setting",
                activeIcon: SvgPicture.asset(
                  "assets/images/bottom_nav_bar/settings_active.svg",
                  height: 28.h,
                  width: 38.w,
                ),
              ),
            ],
          ),
        );
      });
  }
}
