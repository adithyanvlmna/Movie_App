import 'package:flutter/material.dart';
import 'package:movie_app/view/home_view/detail_view.dart';
import 'package:movie_app/widgtes/common_text_field.dart';

import 'package:flutter/material.dart';
import 'package:movie_app/widgtes/common_text_field.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "homeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Dummy data
  final List<Map<String, String>> trendingMovies = [
    {"title": "Spider-Man", "image": "assets/images/detail_img.png"},
    {"title": "Invincible", "image": "assets/images/super_img.png"},
    {"title": "Fast X", "image": "assets/images/init_img.png"},
  ];

  final List<Map<String, String>> upcomingMovies = [
    {"title": "Jurassic Park", "image": "assets/images/detail_img.png"},
    {"title": "Batman", "image": "assets/images/detail_img.png"},
    {"title": "Kingdom", "image": "assets/images/detail_img.png"},
  ];

  final List<String> categories = ["Drama", "Action", "Sci-Fi", "Comedy"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home_img.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextField(
                      controller: TextEditingController(),
                      hinttext: "Search Movie",
                      icon: Icons.search,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            sectionTitle("Trending Movie Near You"),
            buildMovieList(trendingMovies),
            const SizedBox(height: 15),
            sectionTitle("Upcoming"),
            buildMovieList(upcomingMovies),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildMovieList(List<Map<String, String>> movies) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(movie["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, DetailView.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size(100, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
