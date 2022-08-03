import 'package:flutter/material.dart';
import 'package:payments/shared/styles/colors.dart';

// ignore: must_be_immutable
class TraditionalTextFormField extends StatelessWidget {
  TraditionalTextFormField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    this.icon,
    required this.controller,
    this.validate,
    this.maxLength,
    this.suffix,
    this.isPassword = false,
    this.suffixPressed,
    this.enabled = true,
  }) : super(key: key);

  final String hintText;
  final int? maxLength;
  final TextInputType textInputType;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  IconData? suffix;
  bool isPassword = false;
  Function()? suffixPressed;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
      ),
      autofocus: false,
      enabled: enabled,
      maxLength: maxLength,
      validator: validate,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffix != null
            ? IconButton(
                icon: Center(
                  child: Icon(
                    suffix,
                    size: 5,
                  ),
                ),
                onPressed: suffixPressed,
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        isDense: true,
        filled: true,
        fillColor: whiteColor,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: hintTextColor,
          fontSize: 16,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: greyColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: greyColor, width: 1),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: greyColor, width: 1),
        ),
        icon: icon,
      ),
    );
  }
}
