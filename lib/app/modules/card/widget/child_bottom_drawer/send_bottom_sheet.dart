import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/app_colors.dart';
import 'send_email_on_tab_bar.dart';
import 'send_link_on_tab_bar.dart';
import 'send_msg_on_tab_bar.dart';

Widget SendBottomSheet(BuildContext context, CardController controller) {
  return DefaultTabController(
    length: controller.items.length,
    initialIndex: controller.current,
    child: Container(
      height: 560.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 56.w,
            height: 9.h,
            margin: EdgeInsets.only(top: 10.r),
            decoration: ShapeDecoration(
              color: AppColors.gray_1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 5.r),
              child: Icon(
                Icons.close,
                size: 28.sp,
                color: AppColors.gray_1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.r),
            alignment: Alignment.center,
            child: Text(
              'Send Your Business Card',
              style: TextStyle(
                color: AppColors.black_3,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18.r, bottom: 18.r),
            height: 48.h,
            width: 291.w,
            color: AppColors.white_1,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              splashBorderRadius: BorderRadius.all(Radius.circular(2.r)),
              tabs: [
                Tab(
                  text: controller.items[0],
                ),
                Tab(
                  text: controller.items[1],
                ),
                Tab(
                  text: controller.items[2],
                ),
              ],
              labelColor: AppColors.white_1,
              labelStyle: TextStyle(
                color: AppColors.gray_2,
                fontSize: 14.sp,
                fontFamily: "SfBold",
              ),
              unselectedLabelColor: AppColors.gray_3,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: controller.hexStringToColor(
                  controller.cardColor.value) ?? AppColors.purple_1,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SendLinkOnTabBar(context, controller),
                SendEmailOnTabBar(context, controller),
                SendMsgOnTabBar(context, controller),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
