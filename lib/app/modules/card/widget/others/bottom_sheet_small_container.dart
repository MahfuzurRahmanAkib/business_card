import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetSmallContainer extends StatelessWidget {
  final String text, link;

  const BottomSheetSmallContainer({
    super.key,
    required this.text,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 145.w,
      decoration: ShapeDecoration(
        color: AppColors.white_9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(link),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.gray_4,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
