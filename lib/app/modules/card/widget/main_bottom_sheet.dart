import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/app_colors.dart';
import '../../../core/common_wigets/common_text.dart';
import '../../../core/common_wigets/dialog_utils.dart';
import '../controllers/card_controller.dart';
import 'child_bottom_drawer/send_bottom_sheet.dart';
import 'others/bottom_sheet_big_container.dart';
import 'others/bottom_sheet_medium_container.dart';
import 'others/bottom_sheet_small_container.dart';

class MainBottomSheet extends StatelessWidget {
  final CardController controller;
  final BuildContext context;
  final int index;
  int? id;

  MainBottomSheet({
    Key? key,
    required this.controller,
    required this.context,
    required this.index,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 690.h,
        width: Get.width,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r),
              topLeft: Radius.circular(25.r),
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0.r),
            topRight: Radius.circular(25.0.r),
          ),
          child: Container(
            color: AppColors.white_1,
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  height: 25.h,
                  width: Get.width,
                  decoration: ShapeDecoration(
                    color: controller
                            .hexStringToColor(controller.cardColor.value) ??
                        AppColors.black_3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        topLeft: Radius.circular(25.r),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 35.w,
                        height: 5.h,
                        decoration: ShapeDecoration(
                          color: AppColors.white_1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8.r, left: 21.r),
                        child: CommonText(
                          text: 'Work',
                          size: 24.sp,
                          align: TextAlign.left,
                          weight: FontWeight.w700,
                          color: AppColors.black_3,
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.r, right: 21.r),
                      child: Row(
                        children: [
                          /// Send
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                )),
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: SizedBox(
                                      height: 570.h,
                                      child:
                                          SendBottomSheet(context, controller),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const BottomSheetBigContainer(
                                text: "Send",
                                subText: 'Share via QR, email, text and more.',
                                link: "assets/images/bottom_sheet/send.png",
                                color: AppColors.iconBackground_1),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),

                          ///view
                          GestureDetector(
                              onTap: () {
                                controller.goToView();
                              },
                              child: const BottomSheetBigContainer(
                                  text: "View",
                                  subText: 'Open your card in Business card',
                                  link: "assets/images/bottom_sheet/view1.png",
                                  color: AppColors.iconBackground_2)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.r, right: 21.r),
                      child: Row(
                        children: [
                          ///edit
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              controller.goToEditView(id);
                            },
                            child: const BottomSheetBigContainer(
                                text: "Edit",
                                subText: 'Share via QR, email, text and more.',
                                link: "assets/images/bottom_sheet/edit.png",
                                color: AppColors.iconBackground_3),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),

                          ///view
                          GestureDetector(
                              onTap: () {},
                              child: const BottomSheetBigContainer(
                                  text: "View",
                                  subText: 'Open your card in Business card',
                                  link: "assets/images/bottom_sheet/view.png",
                                  color: AppColors.iconBackground_4)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 260.h,
                      width: 335.w,
                      margin: EdgeInsets.only(right: 20.r, left: 21.r),
                      decoration: ShapeDecoration(
                        color: AppColors.iconBackground_3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /// qr
                              GestureDetector(
                                  onTap: () {},
                                  child: const BottomSheetMediumContainer(
                                    text: 'Download QR',
                                    link: "assets/images/bottom_sheet/qr.png",
                                    color: AppColors.iconBackground_5,
                                  )),

                              /// nfc
                              GestureDetector(
                                  onTap: () {},
                                  child: const BottomSheetMediumContainer(
                                    text: 'Write to NFC',
                                    link: "assets/images/bottom_sheet/nfc.png",
                                    color: AppColors.iconBackground_6,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///transfer
                              GestureDetector(
                                onTap: () {
                                  DialogUtils.showCardTransferDialog(
                                      context, controller);
                                },
                                child: const BottomSheetMediumContainer(
                                  text: 'Transfer',
                                  link:
                                      "assets/images/bottom_sheet/transfer.png",
                                  color: AppColors.iconBackground_7,
                                ),
                              ),

                              /// duplicate
                              GestureDetector(
                                  onTap: () {
                                    controller.duplicateCard();
                                    controller.getCardInformation();
                                    Navigator.pop(context, true);
                                  },
                                  child: const BottomSheetMediumContainer(
                                    text: 'Duplicate',
                                    link:
                                        "assets/images/bottom_sheet/duplicate.png",
                                    color: AppColors.iconBackground_8,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /// settings
                              GestureDetector(
                                  onTap: () {},
                                  child: const BottomSheetSmallContainer(
                                    text: 'Settings',
                                    link:
                                        'assets/images/bottom_sheet/settings.png',
                                  )),

                              /// delete
                              GestureDetector(
                                onTap: () {
                                  controller.deleteCard();
                                  controller.getCardInformation();
                                  Navigator.pop(context, true);
                                },
                                child: const BottomSheetSmallContainer(
                                  text: 'Delete',
                                  link: 'assets/images/bottom_sheet/delete.png',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
