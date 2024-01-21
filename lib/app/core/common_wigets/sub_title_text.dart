import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/app_colors.dart';
import 'common_text.dart';

class SubTitleText extends StatelessWidget {
  String text;

  SubTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.r, left: 10.r, right: 10.r),
      child: CommonText(
        text: text,
        align: TextAlign.center,
        color: AppColors.gray_3,
        size: 14.sp,
        weight: FontWeight.w400,
      ),
    );
  }
}
