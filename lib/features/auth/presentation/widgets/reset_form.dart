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

class ResetForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundApp(),
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LogoApp(),
                HeaderH1(text: 'إعادة تعيين كلمة المرور'),

                const SizedBox(height: 30), // Add space between logo and header
                InputPrimary(
                  label: 'البريد الإلكتروني', // Email label
                  placeholder: 'أدخل بريدك الإلكتروني', // Email placeholder
                  icon: Icons.email, // Email icon
                  controller: emailController, // Email controller
                ),
                SizedBox(height: 20),
                ButtonPrimary(
                  text: 'أنشئ حسابك', // Button text
                  onPressed: () {
                    final email =
                        emailController.text; // Get email from controller
                    context.read<AuthCubit>().reset(email);
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  alignment:
                      Alignment.center, // Align the container to the left
                  child: Text(
                    'لدي حساب',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
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
