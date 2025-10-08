import 'package:flutter/material.dart';

import 'package:movie_app/core/app_theme/app_colors.dart';
import 'package:movie_app/core/utils/app_size.dart';

class CommonButton extends StatelessWidget {
  final IconData? iconData;
  final bool? isRound;
  final String? text;
  final double? width;
  final bool? isLoad;
  final bool? iscolor;

  final Function()? onTap;
  const CommonButton({
    super.key,
    required this.onTap,
    this.width,
    this.isLoad = false,
    this.text,
    this.isRound = false,
    this.iscolor = false,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? screenWidth(context, 1.1),
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          color: iscolor == true ? Colors.red : AppColors.buttonwhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: isLoad == true
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.buttontextColor,
                ))
              : Text(
                  text!,
                  style: TextStyle(
                    color: AppColors.buttontextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
