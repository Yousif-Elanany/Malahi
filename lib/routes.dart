import 'package:flutter/material.dart';
import 'package:malahi_app/features/auth/presentation/pages/new_password_page.dart';
import 'package:malahi_app/features/home/presentation/pages/home_page.dart';
import 'package:malahi_app/features/packs/presentation/pages/packs_page.dart';
import 'package:malahi_app/features/packs/presentation/pages/packs_search_page.dart';
import 'package:malahi_app/features/settings/presentation/pages/about_page.dart';
import 'package:malahi_app/features/settings/presentation/pages/privacy_policy_page.dart';
import 'package:malahi_app/features/splash/presentation/pages/onboarding_screen.dart';
import 'package:malahi_app/features/tabs/presentation/pages/tabs_page.dart';
import 'package:malahi_app/features/tickets/presentation/pages/tickets_search_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/forgot_password_page.dart';
import 'features/offers/presentation/pages/offers_page.dart';
import 'features/tickets/presentation/pages/tickets_page.dart';
import 'features/payments/presentation/pages/payment_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/splash/presentation/pages/splash_screen.dart'; // Add splash screen import

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) =>
              SplashScreen()); // Set splash screen as the initial screen
    case '/onboarding':
      return MaterialPageRoute(builder: (_) => OnboardingScreen());

    case '/tabs':
      return MaterialPageRoute(builder: (_) => TabsPage());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case '/forgot-password':
      return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
    case '/new-password':
      return MaterialPageRoute(builder: (_) => NewPasswordPage());
    case '/about':
      return MaterialPageRoute(builder: (_) => AboutPage());
    case '/privacy-policy':
      return MaterialPageRoute(builder: (_) => PrivacyPolicyPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomePage());
    case '/ticket':
      return MaterialPageRoute(builder: (_) => TicketsPage());
    case '/tickets_search':
      return MaterialPageRoute(builder: (_) => TicketsSearchPage());
    case '/packs':
      return MaterialPageRoute(builder: (_) => PacksPage());
    case '/packs_search':
      return MaterialPageRoute(builder: (_) => PacksSearchPagePage());

    /* case '/offers':
      return MaterialPageRoute(builder: (_) => OffersPage());
    case '/tickets':
      return MaterialPageRoute(builder: (_) => TicketsPage());
    case '/payment':
      return MaterialPageRoute(builder: (_) => PaymentPage());
    case '/profile':
      return MaterialPageRoute(builder: (_) => ProfilePage()); */
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
