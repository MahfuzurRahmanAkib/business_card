import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common_wigets/common_text.dart';

class SettingsCardDetails extends StatelessWidget {
  String text;
  VoidCallback? onTap;

  SettingsCardDetails({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      margin: EdgeInsets.only(left: 10.r, right: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: text,
            color: AppColors.gray_4,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.gray_3,
            size: 16.r,
          ),
        ],
      ),
    );
  }
}
