import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final IconData icon;
  final void Function()? onPressed;
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.buttonwhiteColor)
      );
    }

    return TextFormField(
      cursorColor: AppColors.buttontextColor,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.buttonwhiteColor,
       hintText: hinttext,
hintStyle: TextStyle(color: AppColors.buttontextColor),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
        prefixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColors.buttontextColor,
            )),
      ),
    );
  }
}
