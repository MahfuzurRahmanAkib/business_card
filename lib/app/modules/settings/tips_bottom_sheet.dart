import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:business_card_api/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TipsBottomSheet extends StatelessWidget {
  final SettingsController settingsController;
  final int activeIndex;

  const TipsBottomSheet(this.settingsController, this.activeIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 375.h,
        width: Get.width,
        decoration: ShapeDecoration(
          color: AppColors.white_1,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 5.h,
              margin: EdgeInsets.only(top: 10.r, bottom: 5.r),
              decoration: ShapeDecoration(
                color: AppColors.gray_1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 24.w,
                    height: 24.h,
                    margin: EdgeInsets.only(right: 20.r),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.cancel, size: 24.r),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                itemCount: settingsController.details.length,
                onPageChanged: (int index) {
                  settingsController.setActiveIndex(index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          SizedBox(
                            width: 289.w,
                            child: CommonText(
                              text: settingsController.heading[index],
                              size: 18.sp,
                              align: TextAlign.center,
                              weight: FontWeight.w700,
                              color: AppColors.black_3,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: CommonText(
                              text: settingsController.details[index],
                              size: 14.sp,
                              align: TextAlign.center,
                              weight: FontWeight.w400,
                              color: AppColors.gray_3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int index = 0; index < settingsController.details.length; index++)
                    Container(
                      height: 10.h,
                      width: 10.w,
                      margin: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: index == settingsController.activeIndex.value
                            ? AppColors.purple_1
                            : AppColors.gray_1,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              );
            }),

            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}
