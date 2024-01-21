import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarController());
    return Obx(() {
      return Scaffold(
        body: Center(
          child: BottomNavBarController.widgetOptions
              .elementAt(controller.selectedIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.onItemTapped,
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
          currentIndex: controller.selectedIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedFontSize: 14.sp,
          selectedFontSize: 14.sp,
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
