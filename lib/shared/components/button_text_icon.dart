import 'package:flutter/material.dart';
import 'package:payments/shared/styles/colors.dart';

// ignore: must_be_immutable
class CustomMaterialButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final Function() pressed;
  final String text;
  final Color? textColor;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;

  final double? topLeftRadius;

  final double? topRightRadius;

  final bool isUpperCase;
  final double? fontSize;
  final FontWeight? fontWeight;
  TextAlign? textAlign;

  CustomMaterialButton({
    Key? key,
    this.width,
    this.height = 60,
    this.background = primaryColor,
    required this.pressed,
    required this.text,
    this.textColor = Colors.white,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.isUpperCase = false,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftRadius!),
            bottomRight: Radius.circular(bottomRightRadius!),
            topLeft: Radius.circular(topLeftRadius!),
            topRight: Radius.circular(topRightRadius!),
          ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          textAlign: textAlign,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
