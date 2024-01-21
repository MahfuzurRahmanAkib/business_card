import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/bottom_rich_text.dart';
import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/common_text_field.dart';
import '../../../core/common_wigets/sub_title_text.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../../../core/common_wigets/title_text.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2FA),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.r),
            child: Form(
              key: controller.formFieldKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleText(text: "Welcome Back"),
                  SubTitleText(
                      text: "It is a long established fact that a reader"),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBoxHeadingText(text: "Email Address"),
                          CommonEmailTextField(
                            emailController: controller.emailController.value,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoxHeadingText(text: "Password"),
                            GestureDetector(
                              onTap: () {
                                controller.goToForgetPage();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5.r),
                                child: CommonText(
                                  text: "Forget Password?",
                                  size: 12.sp,
                                  color: const Color(0xFF8C8C8C),
                                  weight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(() {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: controller.isPasswordVisible.value,
                          validator: controller.validatePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Password",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.r, horizontal: 20.r),
                            alignLabelWithHint: true,
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
                          controller: controller.passwordController.value,
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
                              controller.userLogin(
                                  controller.emailController.value.text,
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
                                text: "Sign-in",
                                size: 16.sp,
                                color: Colors.white,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 32.r, bottom: 20.r),
                        child: CommonText(
                          text: 'or Continue with',
                          size: 12.sp,
                          color: const Color(0xFF777777),
                          weight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2FA),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Image.asset("assets/images/login_page/google.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.r),
                    child: GestureDetector(
                      onTap: () {
                        controller.goToSignIn();
                      },
                      child: BottomRichText(
                          firstText: "Open an Account?",
                          lastText: "Create Account"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
