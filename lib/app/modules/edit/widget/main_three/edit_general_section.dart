import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../data/app_colors.dart';
import '../../../../core/common_wigets/common_text.dart';
import '../../../../core/common_wigets/text_box_heading_text.dart';
import '../../controllers/edit_controller.dart';

class EditGeneralSection extends StatelessWidget {
  final EditController editController;

  const EditGeneralSection(this.editController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.r, left: 20.r),
                alignment: Alignment.centerLeft,
                child: CommonText(
                  text: "Card Name",
                  size: 20.sp,
                  weight: FontWeight.w700,
                  color: AppColors.black_3,
                ),
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "New Card"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.nameController.value,
                      decoration: InputDecoration(
                        hintText: "Name",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "First Name"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.firstNameController.value,
                      decoration: InputDecoration(
                        hintText: "First Name",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Last Name"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.lastNameController.value,
                      decoration: InputDecoration(
                        hintText: "Last Name",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Prefix"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.prefixController.value,
                      decoration: InputDecoration(
                        hintText: "Prefix",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.only(left: 20.r),
                alignment: Alignment.centerLeft,
                child: CommonText(
                  text: "Affiliation",
                  size: 20.sp,
                  weight: FontWeight.w700,
                  color: AppColors.black_3,
                ),
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Title"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.titleController.value,
                      decoration: InputDecoration(
                        hintText: "Title",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Department"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.departmentController.value,
                      decoration: InputDecoration(
                        hintText: "Department",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Company"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.companyController.value,
                      decoration: InputDecoration(
                        hintText: "Company",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBoxHeadingText(text: "Headline"),
                  Container(
                    height: 40.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.white_10),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: editController.headlineController.value,
                      decoration: InputDecoration(
                        hintText: "Headline",
                        filled: true,
                        fillColor: AppColors.white_1,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black_1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.r),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(
                            color: AppColors.white_1,
                          ),
                        ),
                        alignLabelWithHint: true,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}
