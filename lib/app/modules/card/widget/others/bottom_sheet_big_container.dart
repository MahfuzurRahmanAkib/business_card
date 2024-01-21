import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/app_colors.dart';
import '../../../../core/common_wigets/common_text.dart';

class BottomSheetBigContainer extends StatelessWidget {
  final String text, subText, link;
  final Color color;

  const BottomSheetBigContainer({
    super.key,
    required this.text,
    required this.subText,
    required this.link,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 157.w,
        height: 142.h,
        margin: EdgeInsets.only(top: 8.r),
        decoration: ShapeDecoration(
          color: AppColors.iconBackground_3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32.h,
              width: 32.w,
              margin: EdgeInsets.only(left: 16.r, top: 16.r),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Image.asset(
                link,
                height: 32.h,
                width: 32.w,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.r, top: 10.r),
              child: CommonText(
                text: text,
                size: 16.sp,
                align: TextAlign.left,
                weight: FontWeight.w500,
                color: AppColors.black_3,
              ),
            ),
            Container(
              width: 132.w,
              margin: EdgeInsets.only(left: 15.r, top: 5.r),
              child: CommonText(
                text: subText,
                size: 13.sp,
                align: TextAlign.left,
                weight: FontWeight.w400,
                color: AppColors.gray_3,
                height: 1.h,
              ),
            )
          ],
        ));
  }
}
