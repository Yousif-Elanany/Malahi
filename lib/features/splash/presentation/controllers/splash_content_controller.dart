// lib/features/splash/presentation/controllers/splash_content_controller.dart

import 'package:flutter/material.dart';
import 'package:malahi_app/core/services/onboarding_service.dart';

class SplashContentController with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final OnboardingService _onboardingService = OnboardingService();

  void skip(BuildContext context) {
    _onboardingService.completeOnboarding();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
