import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallIconImages extends StatelessWidget {
  String link;

  SmallIconImages({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2FA),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Image.asset(link, fit: BoxFit.fill));
  }
}
