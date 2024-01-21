import 'dart:convert';

import 'package:business_card_api/app/data/repository/update_profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';

class UpdateController extends GetxController {
  final nameController = TextEditingController().obs;
  final RxString profileImagePath = "".obs;
  final base64Image = "".obs;
  final count = 0.obs;
  List<int> imageBytes = <int>[].obs;

  Future<void> pickAndConvertImage(
    RxString imagePath,
    List<int> imageBytes,
    ImageSource source,
  ) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image != null) {
      imagePath.value = image.path.toString();
      imageBytes.clear();
      imageBytes.addAll(await image.readAsBytes());
      base64Image.value = base64Encode(imageBytes);
    }
  }

  Future<void> getProfileImageFromCamera() async {
    await pickAndConvertImage(profileImagePath, imageBytes, ImageSource.camera);
  }

  Future<void> getProfileImageFromGallery() async {
    await pickAndConvertImage(
        profileImagePath, imageBytes, ImageSource.gallery);
  }

  Future<void> updateProfile(String name, String imagePath) async {
    bool ok = await UpdateProfileRepository.updateProfile(name, imagePath);

    if (ok) {
      Get.toNamed(Routes.BOTTOM_NAV_BAR);
    } else {
      Get.snackbar("", 'Failed to Update profile');
    }
  }
}
