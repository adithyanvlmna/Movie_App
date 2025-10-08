import 'package:flutter/material.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view/initial_view.dart/init_veiw.dart';
import 'package:movie_app/view/initial_view.dart/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
     debugShowCheckedModeBanner: false,
     initialRoute: SplashScreen.routeName,
     routes:routes ,
    );
  }
}
