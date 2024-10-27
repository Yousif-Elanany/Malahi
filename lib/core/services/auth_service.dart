import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Key for storing the user's login status in SharedPreferences
  static const String _isLoggedInKey = 'is_logged_in';

  // Method to check if the user is logged in
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Method to log in the user
  Future<void> login(user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save user details to SharedPreferences
    await prefs.setString('userId', user.id);
    await prefs.setString('email', user.email);
    await prefs.setString('username', user.username);
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Method to log out the user
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', '');
    await prefs.setString('email', '');
    await prefs.setString('username', '');
    await prefs.setBool(_isLoggedInKey, false);
  }
}
