import 'package:business_card_api/app/data/api_endpoints.dart';
import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/common_wigets/common_text.dart';
import '../controllers/card_controller.dart';
import '../widget/main_bottom_sheet.dart';

class CardView extends GetView<CardController> {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardController());

    /// initialize some data
    controller.userName.value =
        controller.userInformation.value.data?.name ?? "";
    controller.userEmail.value =
        controller.userInformation.value.data?.email ?? "";
    controller.userImage.value =
        "${ApiEndPoints.baseImageUrl}${controller.userInformation.value.data?.imageUrl ?? ''}";

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () {
          return Center(
            child: Stack(
              children: [
                /// Main Image
                Column(
                  children: [
                    SizedBox(
                      height: 190.h,
                      width: 375.w,
                      child: Image.asset("assets/images/screen_top/home.png",
                          fit: BoxFit.fill),
                    ),
                  ],
                ),

                /// Profile Box
                Positioned(
                  top: 140.r,
                  left: 30.r,
                  right: 30.r,
                  child: Container(
                    height: 194.h,
                    width: 335.w,
                    decoration: ShapeDecoration(
                      color: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: controller.isLoadingPersonalInformation.value
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              CommonText(
                                text: controller
                                        .userInformation.value.data?.name ??
                                    "",
                                color: AppColors.black_3,
                                weight: FontWeight.w500,
                                size: 20.sp,
                              ),
                              CommonText(
                                text: controller
                                        .userInformation.value.data?.email ??
                                    "",
                                color: AppColors.black_3,
                                weight: FontWeight.w400,
                                size: 14.sp,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      controller.goToUpdateProfile();
                                    },
                                    child: Container(
                                      width: 85.w,
                                      height: 37.h,
                                      padding: EdgeInsets.all(5.r),
                                      decoration: ShapeDecoration(
                                        color: AppColors.backgroundLight,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Center(
                                        child: CommonText(
                                          text: 'Edit Profile',
                                          color: AppColors.purple_1,
                                          size: 12.sp,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.goToCreateCardView();
                                    },
                                    child: Container(
                                      width: 85.w,
                                      height: 37.h,
                                      padding: EdgeInsets.all(5.r),
                                      decoration: ShapeDecoration(
                                        color: AppColors.backgroundLight,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Center(
                                        child: CommonText(
                                          text: 'Create Card',
                                          color: AppColors.purple_1,
                                          size: 12.sp,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                  ),
                ),

                /// Profile Image Circular
                Positioned(
                  top: 90.h,
                  left: 137.5.w,
                  right: 137.5.w,
                  child: controller.isLoadingPersonalInformation.value
                      ? Shimmer.fromColors(
                          baseColor: AppColors.gray_3,
                          highlightColor: AppColors.gray_1,
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundColor: const Color(0xff7c94b6),
                          ),
                        )
                      : CircleAvatar(
                          radius: 50.r,
                          backgroundColor: const Color(0xff7c94b6),
                          backgroundImage: NetworkImage(
                            "${ApiEndPoints.baseImageUrl}${controller.userInformation.value.data?.imageUrl ?? "assets/images/aa.png"}",
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white_1,
                                width: 3.w,
                              ),
                            ),
                          ),
                        ),
                ),

                /// Card
                Positioned(
                  top: 350.r,
                  left: 30.r,
                  right: 30.r,
                  bottom: 20.r,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.r,
                      mainAxisSpacing: 10.r,
                    ),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount:
                        controller.getAllCardList.value.data?.model?.length ??
                            0,
                    itemBuilder: (BuildContext context, int index) {
                      String? primaryColorCode;
                      Color? color;

                      if (index <
                          controller.getAllCardList.value.data!.model!.length) {
                        primaryColorCode = controller
                            .getAllCardList
                            .value
                            .data!
                            .model![index]
                            .display!
                            .cardThemeColor!
                            .primaryColor;
                        color = primaryColorCode != null
                            ? controller.hexStringToColor(primaryColorCode)
                            : Colors.transparent;
                      } else {
                        color = Colors.transparent;
                      }
                      return GestureDetector(
                        onTap: () {
                          controller.index.value = index;
                          controller.currentId.value = controller
                              .getAllCardList.value.data!.model![index].id!;
                          controller.cardUrl.value = controller.getAllCardList
                              .value.data!.model![index].cardUrl!;
                          controller.cardColor.value = controller
                              .getAllCardList
                              .value
                              .data!
                              .model![index]
                              .display!
                              .cardThemeColor!
                              .primaryColor!;

                          Get.bottomSheet(
                            MainBottomSheet(
                              controller: controller,
                              context: context,
                              index: index,
                              id: controller
                                  .getAllCardList.value.data!.model![index].id!,
                            ),
                            barrierColor: Colors.transparent,
                            isDismissible: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            enableDrag: true,
                            isScrollControlled: true,
                          );
                        },
                        child: Container(
                          height: 185.h,
                          width: 170.w,
                          decoration: ShapeDecoration(
                            color: AppColors.red_1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          child: Container(
                            height: 175.h,
                            width: 160.w,
                            padding: EdgeInsets.all(10.r),
                            decoration: ShapeDecoration(
                                color: AppColors.white_1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: AppColors.black_1,
                                    spreadRadius: 2.r,
                                    blurRadius: 5.r,
                                    offset: Offset(2.r, 2.r),
                                  )
                                ]),
                            child: controller.isLoadingCardInformation.value
                                ? Shimmer.fromColors(
                                    baseColor: AppColors.gray_3,
                                    highlightColor: AppColors.gray_1,
                                    child: Container(
                                      height: 175.h,
                                      width: 160.w,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 175.h,
                                    width: 160.w,
                                    decoration: ShapeDecoration(
                                      color: AppColors.white_1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.r),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "${ApiEndPoints.baseImageUrl}${controller.getAllCardList.value.data!.model![index].display!.profileImageUrl}"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Image(
                                        image: AssetImage(controller
                                                .cardStyleImages[controller
                                                        .getAllCardList
                                                        .value
                                                        .data!
                                                        .model![index]
                                                        .display!
                                                        .cardStyle!
                                                        .id!
                                                        .toInt() -
                                                    1]
                                                .imagePath ??
                                            ""),
                                        fit: BoxFit.cover,
                                        color: color ?? Colors.lightBlue,
                                        //color: Colors.orange,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
