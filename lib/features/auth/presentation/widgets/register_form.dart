import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/core/widgets/buttton_primary.dart';
import 'package:malahi_app/core/widgets/header_h1.dart';
import 'package:malahi_app/core/widgets/input_primary.dart';
import 'package:malahi_app/core/widgets/logo_app.dart';
import 'package:malahi_app/core/widgets/subtitle.dart';
import 'package:malahi_app/features/auth/domain/cubit/auth_cubit.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundApp(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                LogoApp(),
                HeaderH1(text: 'أنشئ حسابك'),

                const SizedBox(height: 20), // Add space between logo and header
                InputPrimary(
                  label: 'الاسم الكامل', // Email label
                  placeholder: 'أدخل الاسم الكامل', // Email placeholder
                  icon: Icons.person, // Email icon
                  controller: nameController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'رقم الجوال', // Email label
                  placeholder: 'رقم الجوال', // Email placeholder
                  icon: Icons.person, // Email icon
                  controller: phoneController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'البريد الإلكتروني', // Email label
                  placeholder: 'أدخل بريدك الإلكتروني', // Email placeholder
                  icon: Icons.email, // Email icon
                  controller: emailController, // Email controller
                ),
                SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'كلمة المرور', // Password label
                  placeholder: 'أدخل كلمة المرور', // Password placeholder
                  isPassword: true, // Enable password visibility
                  icon: Icons.lock, // Password icon
                  controller: passwordController, // Password controller
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align to the right
                  children: [
                    Text(
                      'يعد التسجيل قبولا ',
                      style: TextStyle(
                        color:
                            AppColors.textPrimary, // Color for the regular text
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/privacy-policy');
                      }, // Handle tap
                      child: Text(
                        'للقوانين و سياسة الخصوصية', // Clickable text
                        style: TextStyle(
                          color: AppColors
                              .secondary, // Change color for clickable text
                          fontSize: 16,
                          decoration: TextDecoration
                              .underline, // Underline to indicate it's clickable
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                ButtonPrimary(
                  text: 'أنشئ حسابك', // Button text
                  onPressed: () {
                    final name =
                        nameController.text; // Get email from controller
                    final email =
                        emailController.text; // Get email from controller
                    final password =
                        passwordController.text; // Get password from controller
                    context.read<AuthCubit>().register(name, email, password);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Align to the right
                  children: [
                    Text(
                      'لديك حساب ',
                      style: TextStyle(
                        color:
                            AppColors.textPrimary, // Color for the regular text
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      }, // Handle tap
                      child: Text(
                        'سجل دخولك', // Clickable text
                        style: TextStyle(
                          color: AppColors
                              .secondary, // Change color for clickable text
                          fontSize: 16,
                          decoration: TextDecoration
                              .underline, // Underline to indicate it's clickable
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
