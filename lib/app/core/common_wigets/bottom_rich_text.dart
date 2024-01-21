import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomRichText extends StatelessWidget {
  String firstText, lastText;

  BottomRichText({super.key, required this.firstText, required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
              color: const Color(0xFF555555),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              color: const Color(0xFF777777),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: lastText,
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
