import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:business_card_api/app/modules/scan/controllers/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_name_text_field.dart';
import 'common_text.dart';
import 'common_text_field.dart';
import 'text_box_heading_text.dart';
import '../../data/app_colors.dart';
import '../../modules/account_details/controllers/account_details_controller.dart';

class DialogUtils {
  static void showDeleteAccountDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/act_details/delete.png",
                    height: 24.h,
                    width: 24.w,
                  ),
                  CommonText(
                    text: "Delete Account",
                    align: TextAlign.center,
                    size: 20.sp,
                    weight: FontWeight.w700,
                    color: AppColors.black_6,
                  ),
                  CommonText(
                    text:
                        "Are you sure you want to delete this account? This action cannot be undone.",
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: AppColors.black_6,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.deleteAccount();
                    },
                    child: CommonText(
                      text: "Delete Account",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.w, color: const Color(0xFF455468)),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Cancel action
                    },
                    child: CommonText(
                      text: "Cancel",
                      color: AppColors.black_6,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showLogOutDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  CommonText(
                    text: "Warning",
                    align: TextAlign.left,
                    size: 20.sp,
                    weight: FontWeight.w700,
                    color: AppColors.black_6,
                  ),
                  CommonText(
                    text: "Do you want to sign out?",
                    align: TextAlign.left,
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: AppColors.black_6,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.logout();
                    },
                    child: CommonText(
                      text: "Yes",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.white_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.w, color: const Color(0xFF455468)),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Cancel action
                    },
                    child: CommonText(
                      text: "No",
                      color: AppColors.black_6,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showChangePasswordDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/act_details/lock.png",
                    height: 24.h,
                    width: 24.w,
                  ),
                  CommonText(
                      text: "Enter your password",
                      align: TextAlign.center,
                      size: 20.sp,
                      weight: FontWeight.w700,
                      color: AppColors.black_6),
                  CommonText(
                      text: "Enter password to make change.",
                      align: TextAlign.center,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: AppColors.gray_6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.r),
                        child: TextBoxHeadingText(text: "Old Password"),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 303.w,
                        child: CommonNameTextField(
                          nameController: controller.oldPassController.value,
                          hintText: "Old Password",
                          hintColor: AppColors.gray_6,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.r),
                        child: TextBoxHeadingText(text: "New Password"),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 303.w,
                        child: CommonNameTextField(
                          nameController: controller.newPassController.value,
                          hintText: "New Password",
                          hintColor: AppColors.gray_5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.changePassword(
                          controller.oldPassController.value.text,
                          controller.newPassController.value.text);

                      Navigator.of(dialogContext).pop();
                    },
                    child: CommonText(
                      text: "Confirm",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showChangeEmailDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/act_details/mail.png",
                    height: 24.h,
                    width: 24.w,
                  ),
                  CommonText(
                      text: "Email Change",
                      align: TextAlign.center,
                      size: 20.sp,
                      weight: FontWeight.w700,
                      color: AppColors.black_6),
                  CommonText(
                      text: "Enter Email to make change.",
                      align: TextAlign.center,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: AppColors.black_6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.r),
                        child: TextBoxHeadingText(text: "New Email Address"),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 303.w,
                        child: CommonNameTextField(
                          nameController: controller.newEmail.value,
                          hintText: "New Email Address",
                          hintColor: AppColors.gray_5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                    ),
                    onPressed: () {
                      controller.changeEmail(controller.newEmail.value.text);
                      showEmailOtpDialogDialog(context, controller);
                    },
                    child: CommonText(
                      text: "Confirm",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showExportContactDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          ),
          actions: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: AppColors.black_1,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/act_details/export.png",
                  height: 24.h,
                  width: 24.w,
                ),
                CommonText(
                    text: "Export Contacts",
                    align: TextAlign.center,
                    size: 20.sp,
                    weight: FontWeight.w700,
                    color: AppColors.black_6),
                CommonText(
                    text:
                        "Contacts will be saved in you current contact list as named in the Cards.",
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                    color: AppColors.black_6),
                SizedBox(
                  height: 5.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(303.w, 32.h),
                    backgroundColor: AppColors.purple_1,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: AppColors.purple_1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  onPressed: () {},
                  child: CommonText(
                    text: "Export Contact",
                    color: AppColors.white_1,
                    size: 16.sp,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  static void showEmailOtpDialogDialog(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/act_details/lock.png",
                    height: 24.h,
                    width: 24.w,
                  ),
                  CommonText(
                      text: "Enter your mail",
                      align: TextAlign.center,
                      size: 20.sp,
                      weight: FontWeight.w700,
                      color: AppColors.black_6),
                  CommonText(
                      text: "Enter Otp and mail to make change.",
                      align: TextAlign.center,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: AppColors.black_6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.r),
                        child: TextBoxHeadingText(text: "New Email"),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 303.w,
                        child: CommonNameTextField(
                          nameController: controller.newEmail.value,
                          hintText: "New Email",
                          hintColor: AppColors.gray_6,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.r),
                        child: TextBoxHeadingText(text: "Otp"),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 303.w,
                        child: CommonNameTextField(
                          nameController: controller.newEmailOtp.value,
                          hintText: "Enter OTP",
                          hintColor: AppColors.gray_5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 52.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: AppColors.purple_1,
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      controller.changeEmailWithOtp(
                          controller.newEmail.value.text,
                          controller.newEmailOtp.value.text);
                    },
                    child: CommonText(
                      text: "Confirm",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCardTransferList(
      BuildContext context, AccountDetailsController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              actions: [
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                          itemCount: controller.cardTransferResponseModel.value
                                  .data?.length ??
                              0,
                          itemBuilder: (context, int index) {
                            final cardData = controller
                                .cardTransferResponseModel.value.data?[index];
                            return ListTile(
                              contentPadding: EdgeInsets.all(5.r),
                              title: CommonText(
                                  text: cardData?.fromUserEmail ??
                                      'No Card Accepted Yet',
                                  size: 16.sp,
                                  color: AppColors.black_1,
                                  weight: FontWeight.w700),
                              subtitle: CommonText(
                                  text:
                                      cardData?.cardModel?.general?.cardName ??
                                          '',
                                  size: 14.sp,
                                  color: AppColors.black_3,
                                  weight: FontWeight.w400),
                            );
                          }),
                    ),
                  )
                ]),
              ]),
        );
      },
    );
  }

  static void showCardTransferDialog(
      BuildContext context, CardController controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            actions: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(dialogContext).pop();
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close,
                        size: 24.sp,
                        color: AppColors.black_1,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/act_details/act.png",
                    height: 24.h,
                    width: 24.w,
                  ),
                  CommonText(
                    text: "Card Transfer",
                    align: TextAlign.center,
                    color: AppColors.black_6,
                    size: 20.sp,
                    weight: FontWeight.w700,
                  ),
                  CommonText(
                    text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    color: AppColors.gray_6,
                    align: TextAlign.center,
                    size: 14.sp,
                    weight: FontWeight.w400,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBoxHeadingText(text: "Email Address"),
                          CommonEmailTextField(
                            emailController:
                            controller.transferEmailController.value,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(303.w, 32.h),
                      backgroundColor: AppColors.purple_1,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: AppColors.purple_1),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () {
                      controller.transferCard(
                          controller.transferEmailController.value.text);
                    },
                    child: CommonText(
                      text: "Confirm",
                      color: AppColors.white_1,
                      size: 16.sp,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
