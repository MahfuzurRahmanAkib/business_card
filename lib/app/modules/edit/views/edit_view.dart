import 'package:business_card_api/app/data/app_colors.dart';
import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../core/model/request_model/cards/card_create_request_model.dart';
import '../controllers/edit_controller.dart';
import '../widget/main_three/edit_display_section.dart';
import '../widget/main_three/edit_field_section.dart';
import '../widget/main_three/edit_general_section.dart';

class EditView extends GetView<EditController> {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getBasicCardInformation();
    return WillPopScope(
      onWillPop: () async {
        Get.find<CardController>().initialCall();
        return true;
      },
      child: Obx(() {
        return Scaffold(
          backgroundColor: AppColors.background,
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
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.find<CardController>().initialCall();
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.r),
                child: GestureDetector(
                  onTap: () {
                    controller.cardUpdateRequestModelValues.value =
                        CardCreateRequestModel(
                            parentCardId: null,
                            cardType: "Card",
                            isScanedCard: false,
                            general: General(
                              cardName: controller.nameController.value.text
                                  .toString(),
                              personal: Personal(
                                prefix: controller.prefixController.value.text
                                    .toString(),
                                nameFirst: controller
                                    .firstNameController.value.text
                                    .toString(),
                                nameMiddle: null,
                                nameLast: controller
                                    .lastNameController.value.text
                                    .toString(),
                                suffix: null,
                              ),
                              affiliation: Affiliation(
                                title: controller.titleController.value.text
                                    .toString(),
                                department: controller
                                    .departmentController.value.text
                                    .toString(),
                                company: controller.companyController.value.text
                                    .toString(),
                                aboutHeadline: controller
                                    .headlineController.value.text
                                    .toString(),
                              ),
                            ),
                            display: Display(
                              profileImageData: controller
                                  .base64ProfileImage.value
                                  .toString(),
                              logoImageData:
                                  controller.base64LogoImage.value.toString(),
                              badgeImageData: null,
                              cardStyleId:
                                  controller.designIndex.value.toInt() + 1,
                              cardThemeColorId:
                                  controller.colorId.value.toInt(),
                            ),
                            userCardFields: null);
                    controller.updateCard(
                        controller.cardUpdateRequestModelValues.value);
                  },
                  child: Center(
                      child: CommonText(
                    text: 'Save',
                    size: 16.sp,
                    color: controller.hexStringToColor(
                        Get.find<CardController>().cardColor.value) ??
                        AppColors.purple_1,
                    weight: FontWeight.w500,
                  )),
                ),
              ),
            ],
          ),
          body: DefaultTabController(
            length: controller.items.length,
            initialIndex: controller.current,
            child: Container(
              height: Get.height,
              decoration: ShapeDecoration(
                color: AppColors.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 335.w,
                      height: 48.h,
                      margin: EdgeInsets.symmetric(vertical: 10.r),
                      decoration: ShapeDecoration(
                        color: AppColors.purple_1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.hexStringToColor(
                                  Get.find<CardController>().cardColor.value) ??
                              AppColors.purple_1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: "Preview",
                            size: 16.sp,
                            weight: FontWeight.w500,
                            color: AppColors.white_1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 21.r, bottom: 24.r),
                    height: 48.h,
                    width: 291.w,
                    color: AppColors.white_1,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      splashBorderRadius:
                          BorderRadius.all(Radius.circular(2.r)),
                      tabs: [
                        Tab(
                          text: controller.items[0],
                        ),
                        Tab(
                          text: controller.items[1],
                        ),
                        Tab(
                          text: controller.items[2],
                        ),
                      ],
                      labelColor: AppColors.white_1,
                      labelStyle: TextStyle(
                        color: AppColors.white_1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelColor: AppColors.gray_3,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: controller.hexStringToColor(
                                Get.find<CardController>().cardColor.value) ??
                            AppColors.purple_1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        EditGeneralSection(controller),
                        EditDisplaySection(controller),
                        EditFieldSection(controller),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
