import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/sub_title_text.dart';
import '../../../core/common_wigets/title_text.dart';
import '../controllers/create_account_otp_controller.dart';

class CreateAccountOtpView extends GetView<CreateAccountOtpController> {
  const CreateAccountOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2FA),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFF2F2FA),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleText(text: "Give OTP"),
              SubTitleText(
                  text:
                      "Set the OTP for your account so you can login and get access all the features."),
              PinCodeFields(
                length: 5,
                controller: controller.otpController.value,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 55.h,
                fieldWidth: 45.w,
                borderWidth: 1.0,
                activeBorderColor: Colors.black45,
                activeBackgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(5.0.r),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autoHideKeyboard: true,
                fieldBackgroundColor: Colors.white,
                borderColor: Colors.black12,
                textStyle: TextStyle(
                  fontSize: 25.0.sp,
                  fontWeight: FontWeight.bold,
                ),
                onComplete: (String value) {},
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 335.w,
                  height: 50.h,
                  margin: EdgeInsets.symmetric(vertical: 35.r),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF5B2EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.otpForCreateAccount(
                          controller.otpController.value.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B2EFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: CommonText(
                          text: "Enter OTP For Create Account",
                          size: 16.sp,
                          weight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
