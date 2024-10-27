import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/core/widgets/background_app.dart';
import 'package:malahi_app/core/widgets/buttton_primary.dart';
import 'package:malahi_app/core/widgets/header_h1.dart';
import 'package:malahi_app/core/widgets/logo_app.dart';
import 'package:malahi_app/core/widgets/subtitle.dart';
import 'package:malahi_app/core/widgets/input_primary.dart'; // Import the InputPrimary widget
import 'package:malahi_app/features/auth/domain/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final AuthState state; // Accept the state

  LoginForm({required this.state});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          BackgroundApp(),
          // Scrollable content
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  LogoApp(),
                  HeaderH1(text: 'تسجيل الدخول'),
                  // Subtitle(text: 'لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة'),
                  if (widget.state is AuthLoading)
                    SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                      height: 40,
                    )
                  else
                    const SizedBox(height: 40),

                  InputPrimary(
                    label: 'البريد الإلكتروني', // Email label
                    placeholder: 'أدخل بريدك الإلكتروني', // Email placeholder
                    icon: Icons.email, // Email icon
                    controller: emailController, // Email controller
                  ),
                  const SizedBox(height: 20), // Space between input fields
                  InputPrimary(
                    label: 'كلمة المرور', // Password label
                    placeholder: 'أدخل كلمة المرور', // Password placeholder
                    isPassword: true, // Enable password visibility
                    icon: Icons.lock, // Password icon
                    controller: passwordController, // Password controller
                  ),
                  const SizedBox(height: 20), // Space before the button
                  Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        'نسيت كلمة المرور',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonPrimary(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      context.read<AuthCubit>().login(email, password);
                    },
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align to the right
                    children: [
                      Text(
                        'ليس لديك حساب ',
                        style: TextStyle(
                          color: AppColors
                              .textPrimary, // Color for the regular text
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        }, // Handle tap
                        child: Text(
                          'انشاء حساب', // Clickable text
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
      ),
    );
  }
}
