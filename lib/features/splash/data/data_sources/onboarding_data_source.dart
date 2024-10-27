// lib/features/splash/data/data_sources/onboarding_data_source.dart
import 'package:malahi_app/features/splash/domain/entities/onboarding_entity.dart';

class OnboardingDataSource {
  // This class could fetch onboarding data from a local database or remote API
  List<OnboardingEntity> getOnboardingData() {
    return [
      OnboardingEntity(
        title: 'Welcome to ملاهي',
        subtitle: 'Enjoy the best rides and attractions!',
        image: 'assets/images/onboarding1.png',
      ),
      OnboardingEntity(
        title: 'Exciting Games',
        subtitle: 'Experience thrilling games and rides!',
        image: 'assets/images/onboarding2.png',
      ),
      OnboardingEntity(
        title: 'Family Fun',
        subtitle: 'Fun for the whole family!',
        image: 'assets/images/onboarding3.png',
      ),
    ];
  }
}
