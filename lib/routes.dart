import 'package:flutter/material.dart';
import 'package:movie_app/view/home_view/bottom_nav_bar.dart';
import 'package:movie_app/view/home_view/detail_view.dart';
import 'package:movie_app/view/home_view/home_view.dart';
import 'package:movie_app/view/initial_view.dart/init_veiw.dart';
import 'package:movie_app/view/initial_view.dart/initial_view.dart';
import 'package:movie_app/view/initial_view.dart/splash_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
   InitVeiw.routeName:(ctx)=>InitVeiw(),
   InitialView.routeName:(ctx)=>InitialView(),
    HomeView.routeName:(ctx)=>HomeView(),
     BottomNavBar.routeName:(ctx)=>BottomNavBar(),
     DetailView.routeName:(ctx)=>DetailView(),
      SplashScreen.routeName:(ctx)=>SplashScreen(),
};
