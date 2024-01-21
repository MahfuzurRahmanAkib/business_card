import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common_wigets/common_text.dart';
import '../../../routes/app_pages.dart';
import '../class/lists.dart';
import '../controllers/contact_controller.dart';
import '../widgets/build_design_for_two_contact.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    /// contact with its count
                    Row(
                      children: [
                        CommonText(
                          text: "Contact",
                          size: 26.sp,
                          weight: FontWeight.w700,
                          color: AppColors.black_3,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CommonText(
                          text: "(${controller.totalContact.toString()})",
                          size: 14.sp,
                          weight: FontWeight.w500,
                          color: AppColors.black_1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    /// search view
                    Row(
                      children: [
                        SizedBox(
                          height: 48.h,
                          width: 279.w,
                          child: TextFormField(
                            controller: controller.searchController.value,
                            decoration: InputDecoration(
                              hintText: "Search names, companies.. ",
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors.gray_5,
                              ),
                              filled: true,
                              fillColor: AppColors.white_1,
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray_5,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: const BorderSide(
                                  color: AppColors.white_1,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(top: 5.r),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: const BorderSide(
                                  color: AppColors.white_1,
                                ),
                              ),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.white_1,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: AppColors.gray_5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// contact box
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.contactCardList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.r,
                        mainAxisSpacing: 20.r,
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ALL_CONTACT, arguments: [
                            controller.contactCardList[index].contacts
                          ]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white_1,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: controller.contactCardList[index].contacts!
                                      .length <=
                                  2
                              ? BuildDesignForTwoContact(
                                  smallContactList, index, controller)
                              : Expanded(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 25.w,
                                        top: 18.h,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    smallContactList[0]
                                                        .imgPath!),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 55.w,
                                        top: 18.h,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    smallContactList[1]
                                                        .imgPath!),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 85.w,
                                        top: 18.h,
                                        child: Container(
                                          height: 50.h,
                                          width: 50.w,
                                          decoration: const BoxDecoration(
                                            color: AppColors.white_8,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: CommonText(
                                              text:
                                                  "${controller.contactCardList[index].contacts!.length - 2}+",
                                              size: 15.sp,
                                              weight: FontWeight.w500,
                                              color: AppColors.gray_5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.r,
                                        bottom: 10.r,
                                        right: 10.r,
                                        child: Container(
                                          width: 148.w,
                                          height: 72.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: AppColors.white_3,
                                          ),
                                          child: Center(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  CommonText(
                                                    text: controller
                                                        .contactCardList[index]
                                                        .header
                                                        .toString(),
                                                    size: 15.sp,
                                                    weight: FontWeight.w400,
                                                    color: AppColors.gray_5,
                                                  ),
                                                  CommonText(
                                                    text:
                                                        "${controller.contactCardList[index].contacts!.length.toString()} Contacts",
                                                    size: 15.sp,
                                                    weight: FontWeight.w400,
                                                    color: AppColors.gray_5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 70.h,
                                        left: 58.w,
                                        right: 58.w,
                                        child: Container(
                                          height: 40.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: AppColors.white_1,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: AppColors.white_4,
                                              width: 1.w,
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              controller.contactCardList[index]
                                                  .iconPath
                                                  .toString(),
                                              fit: BoxFit.fill,
                                              height: 18.h,
                                              width: 18.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
