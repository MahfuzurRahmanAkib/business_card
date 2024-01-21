import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_wigets/common_text.dart';
import '../class/contact_list.dart';
import '../controllers/contact_controller.dart';

Column BuildDesignForTwoContact(List<ContactsLists> smallContactList, int index,
    ContactController controller) {
  return Column(
    children: [
      SizedBox(
        height: 18.h,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContactContainer(smallContactList[0].imgPath),
            SizedBox(width: 3.w),
            buildContactContainer(smallContactList[1].imgPath),
          ],
        ),
      ),
      Expanded(
        child: buildContactStack(
          index: index,
          header: controller.contactCardList[index].header.toString(),
          contactCount: controller.contactCardList[index].contacts!.length,
          iconPath: controller.contactCardList[index].iconPath.toString(),
        ),
      ),
    ],
  );
}

Container buildContactContainer(String? imgPath) {
  return Container(
    height: 50.h,
    width: 50.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(imgPath!),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Stack buildContactStack({
  required int index,
  required String header,
  required int contactCount,
  required String iconPath,
}) {
  return Stack(
    children: [
      Positioned(
        left: 10.r,
        bottom: 10.r,
        right: 10.r,
        child: Container(
          width: 148.w,
          height: 72.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white_3,
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  CommonText(
                    text: header,
                    size: 15.sp,
                    weight: FontWeight.w400,
                    color: AppColors.gray_5,
                  ),
                  CommonText(
                    text: "$contactCount Contacts",
                    size: 15.sp,
                    weight: FontWeight.w400,
                    color: AppColors.gray_5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 70.h,
        left: 58.w,
        right: 58.w,
        child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.white_1,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.white_4,
              width: 1.w,
            ),
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              fit: BoxFit.fill,
              height: 18.h,
              width: 18.w,
            ),
          ),
        ),
      ),
    ],
  );
}
