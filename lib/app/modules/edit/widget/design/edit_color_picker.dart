import 'package:business_card_api/app/data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/edit_controller.dart';

class EditColorPicker extends StatelessWidget {
  final Color color;
  final int index, id;
  final EditController editController;
  final Function(Color)? onTap;

  const EditColorPicker({
    Key? key,
    required this.editController,
    required this.color,
    required this.id,
    required this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = editController.selectedColor.value == index;
      return GestureDetector(
        onTap: () {
          editController.setSelectedColor(index);
          editController.colorId.value = id;
          if (onTap != null) {
            onTap!(color);
          }
        },
        child: Container(
            margin: EdgeInsets.only(left: 10.r, right: 10.r),
            padding: EdgeInsets.all(2.r),
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? color : AppColors.white_1,
                width: 2.w,
              ),
            ),
            child: Container(
              width: 34.w,
              height: 34.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            )),
      );
    });
  }
}
