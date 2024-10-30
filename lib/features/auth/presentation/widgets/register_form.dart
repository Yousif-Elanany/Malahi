import 'package:easy_localization/easy_localization.dart';
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

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  bool _isChecked = false;

  void CheckLang(){
     Locale currentLocale = Localizations.localeOf(context);

        if (currentLocale.languageCode == 'ar') {
      // Arabic-specific action
      print('تم تسجيل الدخول بنجاح!'); // E.g., display an Arabic success message
    } else if (currentLocale.languageCode == 'en') {
      // English-specific action
      print('Login successful!'); // E.g., display an English success message
    }

  }

  @override
  Widget build(BuildContext context) {
Locale currentLocale = Localizations.localeOf(context);

    return Stack(
      children: [
        BackgroundApp(),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                LogoApp(),
                HeaderH1(text: 'Create Account'.tr()),

                const SizedBox(height: 20), // Add space between logo and header
                InputPrimary(
                  label: 'الاسم الكامل', // Email label
                  placeholder: 'Enter Your Full Name'.tr(), // Email placeholder
                  icon: Icons.person, // Email icon
                  controller: nameController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'رقم الجوال', // Email label
                  placeholder: 'Enter Your Phone Number'.tr(), // Email placeholder
                  icon: Icons.person, // Email icon
                  controller: phoneController, // Email controller
                ),
                const SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'البريد الإلكتروني', // Email label
                  placeholder: 'Enter Your Email'.tr(), // Email placeholder
                  icon: Icons.email, // Email icon
                  controller: emailController, // Email controller
                ),
                SizedBox(height: 20), // Space between input fields
                InputPrimary(
                  label: 'كلمة المرور', // Password label
                  placeholder: 'Enter Your Password'.tr(), // Password placeholder
                  isPassword: true, // Enable password visibility
                  icon: Icons.lock, // Password icon
                  controller: passwordController, // Password controller
                ),
                SizedBox(height: 20),
 
 
 
         currentLocale.languageCode == 'ar' ?       Column(
          crossAxisAlignment: currentLocale.languageCode == 'ar' ? CrossAxisAlignment.start: CrossAxisAlignment.end,
           children: [
             Row(
                      mainAxisAlignment: currentLocale.languageCode == 'ar' ? MainAxisAlignment.start : MainAxisAlignment.start , // Align to the right
                      children: [
                            Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                        
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy-policy');
                          }, // Handle tap
                          child: Text(
                            'For laws and privacy policy'.tr(), // Clickable text
                            style: TextStyle(
                              color: AppColors
                                  .secondary, // Change color for clickable text
                              fontSize: 12,
                              decoration: TextDecoration
                                  .underline, // Underline to indicate it's clickable
                            ),
                          ),
                        ),
                        Text(
                          'Registration is acceptance.'.tr(),
                          style: TextStyle(
                            color:
                                AppColors.textPrimary, // Color for the regular text
                            fontSize: 12,
                          ),
                        ),
                    
             
                      ],
                    ),
           ],
         ) :       Column(
                    crossAxisAlignment: currentLocale.languageCode == 'ar' ? CrossAxisAlignment.end: CrossAxisAlignment.start,

                  children: [
                    Row(
                     mainAxisAlignment: currentLocale.languageCode == 'ar' ? MainAxisAlignment.end : MainAxisAlignment.start , // Align to the right
 // Align to the right
                      children: [
                            Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                        
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy-policy');
                          }, // Handle tap
                          child: Text(
                            'For laws and privacy policy'.tr(), // Clickable text
                            style: TextStyle(
                              color: AppColors
                                  .secondary, // Change color for clickable text
                              fontSize: 12,
                              decoration: TextDecoration
                                  .underline, // Underline to indicate it's clickable
                            ),
                          ),
                        ),
                      
                        
                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.02),
                      child: Text(
                            'Registration is acceptance.'.tr(),
                            style: TextStyle(
                              color:
                                  AppColors.textPrimary, // Color for the regular text
                              fontSize: 9,
                            ),
                          ),
                    ),
                    
                      ],
                    ),
                    
                  ],
                ) ,
                SizedBox(height: 20),

                ButtonPrimary(
                  text: 'Create Account'.tr(), // Button text
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
                      'Have Account'.tr(),
                      style: TextStyle(
                        color:
                            AppColors.textPrimary, // Color for the regular text
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      }, // Handle tap
                      child: Text(
                        'Login'.tr(), // Clickable text
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
