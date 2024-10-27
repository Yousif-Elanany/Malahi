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

class NewPasswordForm extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Subtitle(text: 'لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة'),
                const SizedBox(height: 30), // Add space between logo and header
                InputPrimary(
                  label: 'رمز التاكيد', // Email label
                  placeholder: 'أدخل رمز التاكيد', // Email placeholder
                  icon: Icons.code, // Email icon
                  controller: codeController, // Email controller
                ),
                SizedBox(height: 20),
                InputPrimary(
                  label: 'كلمة المرور الجديدة', // Email label
                  placeholder: 'أدخل كلمة المرور', // Email placeholder
                  icon: Icons.password, // Email icon
                  controller: passwordController, // Email controller
                ),
                SizedBox(height: 20),
                ButtonPrimary(
                  text: 'أنشئ حسابك', // Button text
                  onPressed: () {
                    final code =
                        codeController.text; // Get email from controller
                    final password =
                        passwordController.text; // Get email from controller
                    context.read<AuthCubit>().newPassword(code, password);
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  alignment:
                      Alignment.center, // Align the container to the left
                  child: Text(
                    'ليس حسابي',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ButtonPrimary(
                  text: 'تسجيل الدخول', // Button text
                  textColor: AppColors.secondary,
                  borderColor: AppColors.secondary,
                  backgroundColor: AppColors.background,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/login'); // Change to your route
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
