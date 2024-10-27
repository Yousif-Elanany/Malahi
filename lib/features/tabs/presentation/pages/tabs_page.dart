import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/core/presentation/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:malahi_app/features/tabs/domain/tabs_controller.dart';
import 'package:malahi_app/features/core/presentation/widgets/bottom_navigation_bar.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 45.0,
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
          ), // Add padding to position it correctly
          child: Container(
            height: 45, // Adjust to desired size
            width: 45, // Adjust to desired size
            decoration: BoxDecoration(
              color: AppColors.primary
                  .withOpacity(0.4), // Background color with opacity
              borderRadius: BorderRadius.circular(45), // Border radius
            ),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: AppColors.primary, // Icon color
              ),
              onPressed: () {
                // Handle left icon action
              },
            ),
          ),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo asset path
            height: 50, // Adjust the height based on your logo
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0), // Add padding to position it correctly
            child: Container(
              height: 45, // Adjust to desired size
              width: 45, // Adjust to desired size
              decoration: BoxDecoration(
                color: AppColors.primary
                    .withOpacity(0.4), // Background color with opacity
                borderRadius: BorderRadius.circular(40), // Border radius
              ),
              child: IconButton(
                icon: Icon(
                  Icons.language,
                  color: AppColors.primary, // Icon color
                ),
                onPressed: () {
                  // Handle right icon action
                },
              ),
            ),
          ),
        ],
      ),
      body: Consumer<TabsController>(
        builder: (context, tabsController, child) {
          return tabsController.getSelectedPage(); // Display the selected page
        },
      ),
      bottomNavigationBar: Consumer<TabsController>(
        builder: (context, tabsController, child) {
          return CustomBottomNavigationBar(
            currentIndex: tabsController.currentIndex,
            onTap: (index) => tabsController.setIndex(index),
          );
        },
      ),
    );
  }
}
