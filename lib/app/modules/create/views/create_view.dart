import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/bottom_rich_text.dart';
import '../../../core/common_wigets/common_name_text_field.dart';
import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/common_text_field.dart';
import '../../../core/common_wigets/sub_title_text.dart';
import '../../../core/common_wigets/text_box_heading_text.dart';
import '../../../core/common_wigets/title_text.dart';
import '../../../data/app_colors.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CreateController());
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.r),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleText(text: 'Create Account'),
                  SubTitleText(
                      text: 'It is a long established fact that a reader'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35.r),
                        child: TextBoxHeadingText(text: "Full Name"),
                      ),
                      CommonNameTextField(
                          nameController: controller.nameController.value),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoxHeadingText(text: "Email Address"),
                      CommonEmailTextField(
                        emailController: controller.emailController.value,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBoxHeadingText(text: "Password"),
                      Obx(() {
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: controller.isPasswordVisible.value,
                          validator: controller.validatePassword,
                          controller: controller.passwordController.value,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.r, horizontal: 20.r),
                            hintText: "Password",
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.red),
                              borderRadius: BorderRadius.circular(5.0.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.w, color: Colors.red),
                              borderRadius: BorderRadius.circular(5.0.r),
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
                        );
                      }),
                    ],
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
                          controller.createAccount(
                              controller.emailController.value.text,
                              controller.nameController.value.text,
                              controller.passwordController.value.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5B2EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Center(
                          child:
                          CommonText(
                            text: "Create Account",
                            size: 16.sp,
                            weight: FontWeight.w500,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.r),
                    child: GestureDetector(
                      onTap: () {
                        controller.goToLogin();
                      },
                      child: BottomRichText(
                          firstText: "Already Have an Account?",
                          lastText: "Sign-In"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
