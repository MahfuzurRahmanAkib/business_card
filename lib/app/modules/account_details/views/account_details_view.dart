import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../bottomNavBar/controllers/bottom_nav_bar_controller.dart';
import '../../card/controllers/card_controller.dart';
import '../controllers/account_details_controller.dart';
import '../widgtes/card_for_act_details.dart';
import '../../../core/common_wigets/dialog_utils.dart';

class AccountDetailsView extends GetView<AccountDetailsController> {
  const AccountDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AccountDetailsController());
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Stack(
            children: [
              /// background image
              Column(
                children: [
                  SizedBox(
                    height: 180.h,
                    width: 375.w,
                    child: Image.asset(
                        "assets/images/screen_top/settings_top.png",
                        fit: BoxFit.cover),
                  ),
                ],
              ),

              /// information box
              Positioned(
                top: 140.r,
                left: 30.r,
                right: 30.r,
                child: Container(
                  height: 201.h,
                  width: 335.w,
                  decoration: ShapeDecoration(
                    color: AppColors.white_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 55.r),
                        child: CommonText(
                          text: Get.find<CardController>().userName.value,
                          color: AppColors.black_3,
                          weight: FontWeight.w500,
                          size: 18.sp,
                        ),
                      ),
                      CommonText(
                        text: Get.find<CardController>().userEmail.value,
                        color: AppColors.gray_4,
                        weight: FontWeight.w400,
                        size: 14.sp,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          height: 55.h,
                          width: 255.w,
                          margin: EdgeInsets.only(
                              left: 41.r, right: 41.r, top: 10.r),
                          decoration: ShapeDecoration(
                            color: AppColors.white_5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CommonText(
                                    text: controller.userInformation.value.data
                                            ?.totalCard
                                            ?.toString() ??
                                        "",
                                    size: 14.sp,
                                    weight: FontWeight.w400,
                                    color: AppColors.black_4,
                                  ),
                                  CommonText(
                                    text: "Cards",
                                    size: 12.sp,
                                    weight: FontWeight.w400,
                                    color: AppColors.black_4,
                                  )
                                ],
                              ),
                              Container(
                                color: AppColors.white_6,
                                height: 20.h,
                                width: 2.w,
                              ),
                              Column(
                                children: [
                                  CommonText(
                                    text: controller.userInformation.value.data
                                            ?.totalContact
                                            ?.toString() ??
                                        "",
                                    size: 14.sp,
                                    weight: FontWeight.w400,
                                    color: AppColors.black_4,
                                  ),
                                  CommonText(
                                    text: "Contacts",
                                    size: 12.sp,
                                    weight: FontWeight.w400,
                                    color: AppColors.black_4,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// profile image
              Positioned(
                top: 90.h,
                left: 137.5.w,
                right: 137.5.w,
                child: CircleAvatar(
                  radius: 50.r,
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

              /// back button
              Positioned(
                top: 20.r,
                left: 20.r,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 28.r,
                    color: AppColors.white_1,
                  ),
                ),
              ),

              /// other fetchers
              Positioned(
                top: 360.r,
                left: 30.r,
                right: 30.r,
                bottom: 0.r,
                child: Container(
                  decoration: ShapeDecoration(
                    color: AppColors.white_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 20.r),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.getCardTransferList();
                            DialogUtils.showCardTransferList(
                                context, controller);
                          },
                          child: const CardForActDetails(
                              title: "Card Transfer List",
                              subtitle: "Transfer your Card",
                              link: "assets/images/settings/card1.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            DialogUtils.showExportContactDialog(
                                context, controller);
                          },
                          child: const CardForActDetails(
                              title: "Export Contacts",
                              subtitle: ""
                                  "Export your Contacts",
                              link: "assets/images/settings/card2.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            DialogUtils.showChangeEmailDialog(
                                context, controller);
                          },
                          child: const CardForActDetails(
                              title: "Change Email",
                              subtitle: "Change your Email",
                              link: "assets/images/settings/card3.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            DialogUtils.showChangePasswordDialog(
                                context, controller);
                          },
                          child: const CardForActDetails(
                              title: "Change Password",
                              subtitle: "Change your Password",
                              link: "assets/images/settings/card4.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goToUpdate();
                          },
                          child: const CardForActDetails(
                              title: "Update Profile",
                              subtitle: "Update your Profile",
                              link: "assets/images/settings/card5.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            DialogUtils.showDeleteAccountDialog(
                                context, controller);
                          },
                          child: const CardForActDetails(
                              title: "Delete Account",
                              subtitle: "Delete your Profile",
                              link: "assets/images/settings/card6.png"),
                        ),
                        Container(
                          width: Get.width,
                          height: 2.h,
                          color: AppColors.white_7,
                        ),
                        GestureDetector(
                          onTap: () {
                            DialogUtils.showLogOutDialog(context, controller);
                          },
                          child: const CardForActDetails(
                            title: "Log Out",
                            link: "assets/images/settings/card6.png",
                            subtitle: '',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
