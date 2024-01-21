import 'package:alphabet_list_scroll_view_fix/alphabet_list_scroll_view.dart';
import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../bottomNavBar/controllers/bottom_nav_bar_controller.dart';
import '../../contact/class/lists.dart';
import '../controllers/all_contact_controller.dart';

class AllContactView extends GetView<AllContactController> {
  const AllContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.black_3,
                          size: 28.r,
                        )),
                    CommonText(
                      text: "All Contact",
                      color: AppColors.black_3,
                      size: 26.sp,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CommonText(
                      text: "(${controller.totalContact.toString()})",
                      color: AppColors.black_1,
                      size: 14.sp,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 20.r),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 48.h,
                        width: 279.w,
                        child: TextFormField(
                          controller: controller.searchController.value,
                          decoration: InputDecoration(
                            hintText: "Search names, companies, ",
                            // isCollapsed: true,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColors.gray_5,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 14.h),
                            filled: true,
                            fillColor: AppColors.white_1,
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray_5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                color: AppColors.white_1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                color: AppColors.white_1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.white_1,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: AppColors.gray_5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 560.h,
                  width: Get.width,
                  margin: EdgeInsets.only(left: 20.r, top: 20.r, bottom: 20.r),
                  child: AlphabetListScrollView(
                    strList: const [
                      "a",
                      "b",
                      "c",
                      "d",
                      "e",
                      "f",
                      "g",
                      "h",
                      "i",
                      "j",
                      "k",
                      "l",
                      "m",
                      "n",
                      "o",
                      "p",
                      "q",
                      "r",
                      "s",
                      "t",
                      "u",
                      "v",
                      "w",
                      "x",
                      "y",
                      "z"
                    ],
                    highlightTextStyle: const TextStyle(
                      color: AppColors.yellow_1,
                    ),
                    showPreview: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    bigContactList[index].imgPath!),
                                fit: BoxFit.fill),
                          ),
                        ),
                        /*Image.network(bigContactList[index].imgPath.toString())*/
                        title: CommonText(
                          text: bigContactList[index].name.toString(),
                          size: 14.sp,
                          weight: FontWeight.w500,
                        ),
                        subtitle: CommonText(
                            text: bigContactList[index].designation.toString(),
                            size: 12.sp,
                            weight: FontWeight.w400),
                      );
                    },
                    indexedHeight: (i) {
                      return 80;
                    },
                    keyboardUsage: true,
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
            onTap: (index) {
              controller.selectedIndex.value = index;
              Get.find<BottomNavBarController>().cIndex.value = index;
              Get.back();
            },
            currentIndex: 2,
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
        ),
      );
    });
  }
}
