import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme/app_textstyles.dart';
import 'package:movie_app/view/home_view/bottom_nav_bar.dart';
import 'package:movie_app/view/home_view/home_view.dart';
import 'package:movie_app/widgtes/common_button.dart';

class InitialView extends StatelessWidget {
  static const String routeName = "initialView";
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/super_img.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/blue_gradient_img.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: CommonButton(
                  onTap: () {
                    Navigator.pushNamed(context, BottomNavBar.routeName);
                    
                  },
                  text: "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
