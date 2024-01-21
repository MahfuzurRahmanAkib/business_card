import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_wigets/common_text.dart';

class FieldSocialMedia extends StatelessWidget {
  final String name;
  final String link;

  const FieldSocialMedia({
    super.key,
    required this.name,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: 335.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.r, right: 10.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  link,
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: 100.w,
                  child: CommonText(
                    text: name,
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: const Color(0xFF333333),
                  ),
                )
              ],
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                alignment: Alignment.center,
                width: 50.w,
                height: 27.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF2F2F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: CommonText(
                  text: "Add",
                  color: const Color(0xFF555555),
                  weight: FontWeight.w400,
                  size: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
