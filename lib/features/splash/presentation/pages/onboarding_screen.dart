// lib/features/splash/presentation/pages/onboarding_screen.dart
import 'package:flutter/material.dart';
import '../widgets/splash_content.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          SplashContent(
            title: 'مرحباً بكم في ملاهي',
            subtitle: 'استمتع بتجربة فريدة وممتعة في أفضل المدن الترفيهية',
            image: 'assets/images/onboarding1.png', // Replace with your image
            currentIndex: _currentIndex, // Pass the current index
          ),
          SplashContent(
            title: 'اكتشف العروض المذهلة',
            subtitle: 'نقدم لك أفضل العروض والخصومات لقضاء أوقات لا تنسى',
            image: 'assets/images/onboarding2.png', // Replace with your image
            currentIndex: _currentIndex, // Pass the current index
          ),
          SplashContent(
            title: 'ابدأ المغامرة الآن',
            subtitle: 'سجل الآن وكن جزءًا من عالم الترفيه',
            image: 'assets/images/onboarding3.png', // Replace with your image
            currentIndex: _currentIndex, // Pass the current index
          ),
        ],
      ),
    );
  }
}
