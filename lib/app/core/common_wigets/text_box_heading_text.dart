import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_text.dart';

class TextBoxHeadingText extends StatelessWidget {
  String text;

  TextBoxHeadingText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.r),
      child: CommonText(
        text: text,
        size: 14.sp,
        weight: FontWeight.w500,
        color: AppColors.black_3,
      ),
    );
  }
}
