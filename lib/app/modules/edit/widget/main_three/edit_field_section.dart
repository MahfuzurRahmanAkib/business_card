import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/core/common_wigets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/api_endpoints.dart';
import '../../controllers/edit_controller.dart';
import '../edit_bottom_sheet.dart';
import '../design/field_social_media.dart';

class EditFieldSection extends StatelessWidget {
  final EditController editController = Get.put(EditController());

  EditFieldSection(
    EditController controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30).r,
        child: Column(
          children: [
            ///social links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Social Links",
                  color: const Color(0xFF333333),
                  size: 28.sp,
                  weight: FontWeight.w700,
                ),
                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: const BoxDecoration(
                      color: Color(0x21573AD4), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: Color(0x21573AD4),
                  ),
                )
              ],
            ),
            SizedBox(height: 22.h),

            /// Search Box
            Container(
              width: 335.w,
              decoration: ShapeDecoration(
                color: AppColors.white_1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r)),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.gray_5,
                    size: 20.r,
                  ),
                  hintText: "Search name, companies",
                  fillColor: AppColors.white_1,
                  filled: true,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 5.r, top: 5.r),
                  hintStyle: TextStyle(
                    color: AppColors.gray_5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: AppColors.white_10),
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: AppColors.white_10),
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22.h),
            ListView.separated(
              separatorBuilder: (BuildContext context, int secondIndex) =>
                  SizedBox(height: 10.h),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: editController.cardFieldTypeList.length,
              itemBuilder: (BuildContext context, int firstIndex) {
                return Obx(() {
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: editController.cardFieldTypeList[firstIndex]
                                      .cardFieldTypeName
                                      .toString() ??
                                  "",
                              color: AppColors.black_3,
                              size: 20.sp,
                              weight: FontWeight.w700,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CommonText(
                                text: "View All",
                                color: AppColors.gray_5,
                                size: 12.sp,
                                weight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                          separatorBuilder:
                              (BuildContext context, int secondIndex) =>
                                  SizedBox(height: 10.h),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: editController
                              .cardFieldTypeList[firstIndex].fieldList!.length,
                          itemBuilder: (BuildContext context, int secondIndex) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: SizedBox(
                                        height: 425.h,
                                        child: EditBottomSheet(
                                          link: editController
                                              .cardFieldTypeList[firstIndex]
                                              .fieldList![secondIndex]
                                              .iconUrl
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: FieldSocialMedia(
                                  name: editController
                                      .cardFieldTypeList[firstIndex]
                                      .fieldList![secondIndex]
                                      .name
                                      .toString(),
                                  link: ApiEndPoints.baseImageUrl +
                                      editController
                                          .cardFieldTypeList[firstIndex]
                                          .fieldList![secondIndex]
                                          .iconUrl
                                          .toString()),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
