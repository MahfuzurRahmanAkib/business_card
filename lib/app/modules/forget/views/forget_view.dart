import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/common_text_field.dart';
import '../../../core/common_wigets/sub_title_text.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../../../core/common_wigets/title_text.dart';
import '../controllers/forget_controller.dart';

class ForgetView extends GetView<ForgetController> {
  const ForgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.r),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleText(text: "Forget Password?"),
                  SubTitleText(
                      text:
                          "Set the new password for your account so you can login and get access all the features."),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoxHeadingText(text: "Email Address"),
                      Form(
                        key: controller.formFieldKey,
                        child: CommonEmailTextField(
                          emailController: controller.emailController.value,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 24.r),
                      width: 335.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF5B2EFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.forgetPasswordEmail(
                              controller.emailController.value.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B2EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Send Email",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 40.r),
                      width: 335.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.goToLogin();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_back_rounded,
                                color: Color(0xFF455468),
                              ),
                              CommonText(
                                text: "Back to Log-In",
                                size: 16.sp,
                                color: const Color(0xFF455468),
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
