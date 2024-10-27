import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:malahi_app/core/services/auth_service.dart';
import 'package:malahi_app/core/services/onboarding_service.dart';
import 'package:malahi_app/features/auth/presentation/pages/login_page.dart';
import 'package:malahi_app/features/splash/presentation/pages/onboarding_screen.dart';
import 'package:malahi_app/features/tabs/presentation/pages/tabs_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final OnboardingService onboardingService = OnboardingService();
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Navigate after a delay
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    // Check if onboarding is complete
    bool isOnboardingComplete = await onboardingService.isOnboardingComplete();

    // Check login status
    bool isLoggedIn = await authService.isLoggedIn();

    await Future.delayed(Duration(seconds: 4)); // Simulate loading time

    if (!isOnboardingComplete) {
      // Navigate to Onboarding Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else if (isLoggedIn) {
      // Navigate to Tabs Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TabsPage()),
      );
    } else {
      // Navigate to Login Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/background.png"), // Your background image
                fit: BoxFit.cover, // Makes the image cover the entire screen
              ),
            ),
          ),
          // Centered logo with FadeTransition
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Centers the column vertically
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    'assets/images/logo.png', // Your logo image
                    height: 300, // Adjust the height as needed
                  ),
                ),
                SizedBox(height: 20), // Space between the image and text
                Text(
                  'مرحبا بكم', // Replace with your desired text
                  style: TextStyle(
                    fontSize: 24, // Adjust text size
                    color: Colors.white, // Change color as needed
                    fontWeight: FontWeight.bold, // Add any other styling here
                  ),
                ),
                SizedBox(height: 20), // Space between the image and text
                Text(
                  'في اكبر مجمع للمراكز الترفيهية', // Replace with your desired text
                  style: TextStyle(
                    fontSize: 18, // Adjust text size
                    color: Colors.white, // Change color as needed
                    fontWeight: FontWeight.bold, // Add any other styling here
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
