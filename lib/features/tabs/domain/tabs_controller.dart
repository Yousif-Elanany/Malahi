import 'package:flutter/material.dart';
import 'package:malahi_app/features/packs/presentation/pages/packs_page.dart';
import 'package:malahi_app/features/profile/presentation/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:malahi_app/features/home/presentation/pages/home_page.dart';
import 'package:malahi_app/features/tickets/presentation/pages/tickets_page.dart';

class TabsController with ChangeNotifier {
  int _currentIndex = 1;
  String _username = 'User Name'; // Default username
  String _pageTitle = "الملاهي"; // Default page title

  int get currentIndex => _currentIndex;
  String get username => _username; // Getter for username
  String get pageTitle => _pageTitle; // Getter for page title

  TabsController() {
    _loadUsername(); // Load username on initialization
  }

  // Method to load username from SharedPreferences
  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username') ??
        'User Name'; // Load saved username or default
    notifyListeners(); // Notify listeners after loading username
    _updatePageTitle(); // Update page title after loading username
  }

  // Method to update the page title or show username based on current tab
  void _updatePageTitle() {
    if (_currentIndex == 0) {
      // Show username only on the Home page
      _pageTitle = _username;
    } else {
      switch (_currentIndex) {
        case 1:
          _pageTitle = "التذاكر";
          break;
        case 2:
          _pageTitle = "الباقات"; // Example title for another page
          break;
        case 3:
          _pageTitle = "الملف الشخصي"; // Example title for another page
          break;
        default:
          _pageTitle = "Home";
      }
    }
  }

  // Method to change the current index (tab)
  void setIndex(int index) {
    _currentIndex = index;
    _updatePageTitle(); // Update the title or username when switching tabs
    notifyListeners(); // Notify listeners after updating the index and title
  }

  // Method to return the page corresponding to the selected tab
  Widget getSelectedPage() {
    switch (_currentIndex) {
      case 0:
        return ProfilePage();
      case 1:
        return HomePage();
      case 2:
        return TicketsPage();
      case 3:
      default:
        return Center(child: Text('Under development'));
    }
  }
}
