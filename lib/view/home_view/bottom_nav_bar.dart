import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme/app_colors.dart';
import 'package:movie_app/view/home_view/home_view.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "bottomNavBar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexNumber = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> bodyView = [
      const HomeView(),
      const Center(child: Text("No search Items Data")),
      const Center(child: Text("No Saved Data")),
      const Center(child: Text("No Profile Data")),
    ];

    return Scaffold(
      body: bodyView[indexNumber],
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 48, 5, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navBarItem(icon: Icons.home_outlined, text: "Home", indexNum: 0),
            navBarItem(
                icon: Icons.search_outlined, text: "Search", indexNum: 1),
            navBarItem(icon: Icons.save_outlined, text: "Saved", indexNum: 2),
            navBarItem(
                icon: Icons.person_outline, text: "Profile", indexNum: 3),
          ],
        ),
      ),
    );
  }

  Widget navBarItem({
    required IconData icon,
    required String text,
    required int indexNum,
  }) {
    final isSelected = indexNumber == indexNum;

    return GestureDetector(
      onTap: () {
        setState(() {
          indexNumber = indexNum;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : AppColors.buttontextColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.red : AppColors.buttontextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
