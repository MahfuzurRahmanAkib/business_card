import 'dart:ffi';

import 'package:business_card_api/app/modules/scan/controllers/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../data/app_colors.dart';
import '../controllers/view_controller.dart';

class ViewView extends GetView<ViewController> {
  const ViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: CommonText(
          text: "Edit Cards",
          size: 28.sp,
          weight: FontWeight.w700,
          color: AppColors.black_3,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.r,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    Get.find<ScanController>()
                        .createContact(Get.find<ScanController>().cardId.value);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Save To Contact List",
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text:
                        "Card Name : ${Get.find<ScanController>().responseModel.value.data?.general?.cardName.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  CommonText(
                    text:
                        "First Name : ${Get.find<ScanController>().responseModel.value.data?.general?.personal?.nameFirst.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  CommonText(
                    text:
                        "Last Name : ${Get.find<ScanController>().responseModel.value.data?.general?.personal?.nameLast.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  CommonText(
                    text:
                        "Title Name : ${Get.find<ScanController>().responseModel.value.data?.general?.affiliation?.title.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  CommonText(
                    text:
                        "Company Name : ${Get.find<ScanController>().responseModel.value.data?.general?.affiliation?.company.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  CommonText(
                    text:
                        "Department Name : ${Get.find<ScanController>().responseModel.value.data?.general?.affiliation?.department.toString() ?? ""}",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
