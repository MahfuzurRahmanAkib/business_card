import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  String text;
  String fontFamily;
  TextAlign? align;
  double size;
  Color color;
  double height;
  FontWeight weight;

  CommonText({
    super.key,
    required this.text,
    this.fontFamily = "SfMedium",
    this.size = 16.0,
    this.align,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: weight,
        height: height,
      ),
    );
  }
}
