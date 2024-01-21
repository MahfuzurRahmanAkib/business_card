import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/sub_title_text.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../../../core/common_wigets/title_text.dart';
import '../controllers/reset_controller.dart';

class ResetView extends GetView<ResetController> {
  const ResetView({Key? key}) : super(key: key);

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
                  TitleText(text: "Reset Password"),
                  SubTitleText(
                      text:
                          "Set the new password for your account so you can login and get access all the features."),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CommonText(
                      text: "Secure Code",
                      size: 14.sp,
                      color: const Color(0xFF333333),
                      weight: FontWeight.w500,
                    ),
                  ),
                  PinCodeFields(
                    length: 5,
                    controller: controller.otpController.value,
                    fieldBorderStyle: FieldBorderStyle.square,
                    responsive: false,
                    fieldHeight: 45.h,
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
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoxHeadingText(text: "Password"),
                        Form(
                          key: controller.formFieldKey,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            obscureText: controller.isPasswordVisible.value,
                            validator: controller.validatePassword,
                            controller: controller.passwordController.value,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Password",
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 20.r),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.w, color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.w, color: Colors.black),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.w, color: Colors.red),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.w, color: Colors.red),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isPasswordVisible.toggle();
                                },
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
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
                              controller.otpController.value.text,
                              controller.passwordController.value.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B2EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: "Reset Password",
                            size: 16.sp,
                            color: Colors.white,
                            weight: FontWeight.w500,
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
                          controller.goToLogIn();
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
