// lib/features/onboarding/presentation/widgets/onboarding_content.dart
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final VoidCallback onSkip;

  const OnboardingContent({Key? key, required this.onSkip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        _buildPage('Welcome to ملاهي!', 'assets/images/onboarding_image1.png'),
        _buildPage(
            'Enjoy exciting rides!', 'assets/images/onboarding_image2.png'),
        _buildPage('Create unforgettable memories!',
            'assets/images/onboarding_image3.png'),
      ],
    );
  }

  Widget _buildPage(String title, String image) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
