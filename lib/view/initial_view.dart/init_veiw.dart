import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme/app_textstyles.dart';
import 'package:movie_app/view/initial_view.dart/initial_view.dart';
import 'package:movie_app/widgtes/common_button.dart';

class InitVeiw extends StatelessWidget {
  static const String routeName = "initView";
  const InitVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/init_img.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Catch Every\nBlockbuster Without\nthe Queue",
                  style: AppTextstyles.primaryTextBlack
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                CommonButton(
                  onTap: () {
                    Navigator.pushNamed(context, InitialView.routeName);
                  },
                  text: "Next",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
