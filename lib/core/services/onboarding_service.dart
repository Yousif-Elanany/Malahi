import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  // Key for storing onboarding completion state in SharedPreferences
  static const String _onboardingCompletedKey = 'onboarding_completed';

  // Method to check if onboarding is complete
  Future<bool> isOnboardingComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  // Method to mark onboarding as complete
  Future<void> completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
  }
}
