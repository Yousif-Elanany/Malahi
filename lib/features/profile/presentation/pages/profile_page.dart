import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/services/auth_service.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/core/widgets/buttton_primary.dart';
import 'package:malahi_app/features/auth/presentation/pages/login_page.dart';
import 'package:malahi_app/features/settings/presentation/pages/about_page.dart';
import 'package:malahi_app/features/settings/presentation/pages/privacy_policy_page.dart';

import '../../../../core/widgets/input_primary.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundApp(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 6.0), // Space between cards
                _buildCard(
                  context,
                  icon: Icons.account_circle,
                  title: 'معلوماتي',
                  onTap: () {
                    _showEditUserModal(context);
                  },
                ),
                _buildCard(
                  context,
                  icon: Icons.info_outline,
                  title: 'حول التطبيق',
                  onTap: () {
                    // Navigate to the About page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    );
                  },
                ),
                SizedBox(height: 6.0), // Space between cards
                _buildCard(
                  context,
                  icon: Icons.privacy_tip_outlined,
                  title: 'سياسة الخصوصية',
                  onTap: () {
                    // Navigate to the Privacy Policy page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage()),
                    );
                  },
                ),
                SizedBox(height: 6.0), // Space between cards
                _buildCard(
                  context,
                  icon: Icons.send,
                  title: 'تواصل معنا',
                  onTap: () {
                    _showSocialMediaModal(context);
                  },
                ),
                SizedBox(height: 6.0), // Space between cards
                _buildCard(
                  context,
                  icon: Icons.logout,
                  title: 'تسجيل الخروج',
                  onTap: () async {
                    // logout user and remove
                    // Create an instance of AuthService
                    AuthService authService = AuthService();

                    // Logout the user
                    await authService.logout();
                    // Navigate to the Privacy Policy page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0, // Remove default card elevation
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300, // Gray color for the line
                width: 1.0, // Thickness of the border (1px)
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 160, 111, 205)
                        .withOpacity(0.2), // Background color with opacity
                    shape: BoxShape.circle, // Circular shape
                  ),
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the circle
                  child: Icon(
                    icon,
                    size: 25.0,
                    color: AppColors.primary, // Icon color
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primary,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the modal with the edit form
  void _showEditUserModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows modal to adjust based on keyboard
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0)), // Rounded top corners
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjust for keyboard
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'معلوماتي',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the modal
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),

                InputPrimary(
                  label: 'الاسم الكامل', // Email label
                  placeholder: 'أدخل الاسم الكامل', // Email placeholder
                  icon: Icons.person, // Email icon
                  // controller: nameController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'رقم الجوال', // Email label
                  placeholder: 'رقم الجوال', // Email placeholder
                  icon: Icons.person, // Email icon
                  // controller: phoneController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'البريد الإلكتروني', // Email label
                  placeholder: 'أدخل بريدك الإلكتروني', // Email placeholder
                  icon: Icons.email, // Email icon
                  // controller: emailController, // Email controller
                ),
                SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'كلمة المرور', // Password label
                  placeholder: 'أدخل كلمة المرور', // Password placeholder
                  isPassword: true, // Enable password visibility
                  icon: Icons.lock, // Password icon
                  // controller: passwordController, // Password controller
                ),
                SizedBox(height: 16),
                // Save Button
                ButtonPrimary(
                  text: 'حفظ', // Button text
                  onPressed: () {
                    /* final name =
                          nameController.text; // Get email from controller
                      final email =
                          emailController.text; // Get email from controller
                      final password =
                          passwordController.text; // Get password from controller
                      context.read<AuthCubit>().register(name, email, password); */
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSocialMediaModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Border radius for the modal
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'تواصل معنا',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'يمكنك التواصل معنا عبر وسائل التواصل الاجتماعي التالية:',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.snapchat,
                              color: Colors.green, size: 36),
                          onPressed: () {
                            // Add WhatsApp action here
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.facebook,
                              color: Colors.blue, size: 36),
                          onPressed: () {
                            // Add X (Twitter) action here
                          },
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.phone, color: Colors.purple, size: 36),
                          onPressed: () {
                            // Add Instagram action here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Close icon in the top-left corner
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the modal
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /* void _showSocialMediaModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'تواصل معنا',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'يمكنك التواصل معنا عبر وسائل التواصل الاجتماعي التالية:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.snapchat, color: Colors.green, size: 36),
                    onPressed: () {
                      // Add WhatsApp action here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue, size: 36),
                    onPressed: () {
                      // Add X (Twitter) action here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.phone, color: Colors.purple, size: 36),
                    onPressed: () {
                      // Add Instagram action here
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  } */
}
