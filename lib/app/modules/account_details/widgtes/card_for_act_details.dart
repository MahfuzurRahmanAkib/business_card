import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_wigets/common_text.dart';

class CardForActDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String link;

  const CardForActDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 335.w,
      color: AppColors.white_1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 45.w,
            height: 45.h,
            child: Column(
              children: [
                Container(
                    width: 45.w,
                    height: 45.h,
                    margin: EdgeInsets.only(left: 10.r),
                    decoration: const ShapeDecoration(
                      color: AppColors.white_5,
                      shape: CircleBorder(),
                    ),
                    child: Image.asset(
                      link,
                      height: 24.h,
                      width: 24.w,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: title,
                  color: const Color(0xFF333333),
                  size: 14.sp,
                  weight: FontWeight.w500,
                ),
                CommonText(
                  text: subtitle,
                  color: AppColors.gray_7,
                  size: 12.sp,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
            ),
          ),
        ],
      ),
    );
  }
}
