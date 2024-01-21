import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class SendLinkOnTabBar extends StatelessWidget {
  final BuildContext context;
  final CardController controller;

  const SendLinkOnTabBar(this.context, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// qr code
            SizedBox(
              height: 213.h,
              width: 213.w,
              child: Center(
                child: QrImageView(
                  data: controller.cardUrl.value,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            /// text
            Center(
              child: Text(
                'Point Your Camera at The QR Code.',
                style: TextStyle(
                  color: AppColors.black_3,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            /// button
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 335.w,
                height: 48.h,
                margin: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
                decoration: ShapeDecoration(
                  color: AppColors.purple_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Share.share(controller.cardUrl.value, subject: "ABC");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller
                            .hexStringToColor(controller.cardColor.value) ??
                        AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Send Link",
                      style: TextStyle(
                        color: AppColors.white_1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
