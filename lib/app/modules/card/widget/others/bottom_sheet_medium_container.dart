import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetMediumContainer extends StatelessWidget {
  final String text, link;
  final Color color;

  const BottomSheetMediumContainer({
    super.key,
    required this.text,
    required this.link,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 145.w,
      decoration: ShapeDecoration(
        color: AppColors.white_9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: ShapeDecoration(
                color: AppColors.gray_8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Image.asset(
                link,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.black_3,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
