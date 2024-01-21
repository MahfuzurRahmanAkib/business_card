import 'package:business_card_api/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

import 'small_icon_images.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia(
    LoginController controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: SmallIconImages(
            link: "assets/images/login_page/google.png",
          ),
        ),
      ],
    );
  }
}
