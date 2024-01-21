import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/app_colors.dart';
import 'common_text.dart';

class TitleText extends StatelessWidget {
  String text;

  TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 103.r, bottom: 8.r),
      child: CommonText(
        text: text,
        align: TextAlign.center,
        color: AppColors.black_3,
        size: 24.sp,
        weight: FontWeight.w700,
      ),
    );
  }
}
