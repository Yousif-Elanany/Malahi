import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  BoxDecoration _buildTabDecoration(int index) {
    return BoxDecoration(
        /* color:
          currentIndex == index ? const Color(0xFFE8413D) : Colors.transparent,
      borderRadius: BorderRadius.circular(10), */
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          elevation: 0, // remove shadow
          selectedItemColor: Colors.white, // Selected icon color
          unselectedItemColor: Color(0xffC4C4C4), // Unselected icon color
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20, // Reduce icon size
          ),
          unselectedIconTheme: const IconThemeData(
            color: Color(0xffC4C4C4),
            size: 20, // Reduce unselected icon size
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(0.0), // Adjust padding
                child: const Icon(Icons.account_circle),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(0.0), // Adjust padding
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(0.0), // Adjust padding
                child: const Icon(Icons.favorite),
              ),
              label: 'favories',
            ),
            /* BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(0.0), // Adjust padding
                child: const Icon(Icons.approval_sharp),
              ),
              label: 'favories',
            ), */
          ],
        ),
      ),
    );
  }
}
