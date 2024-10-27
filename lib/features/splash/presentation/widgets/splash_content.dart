// lib/features/splash/presentation/widgets/splash_content.dart

import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/header_h1.dart';
import 'package:malahi_app/core/widgets/logo_app.dart';
import 'package:malahi_app/features/splash/presentation/controllers/splash_content_controller.dart';
import 'dots_indicator.dart'; // Import the DotsIndicator
import 'package:provider/provider.dart'; // Import provider package

class SplashContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int currentIndex; // New parameter for the current index

  const SplashContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SplashContentController>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image), // The image for the background
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoApp(),
          // Card at the bottom
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderH1(
                    text: title, // Use the global HeaderH1 widget
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style:
                        TextStyle(fontSize: 16, color: AppColors.textPrimary),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  // Row for Ignore button and DotsIndicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.skip(context);
                        },
                        child: Text(currentIndex == 2 ? 'ابدأ' : 'تخطي',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      DotsIndicator(
                        dotCount: 3, // Total number of dots
                        currentIndex: currentIndex, // Pass the current index
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
