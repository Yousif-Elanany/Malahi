import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class InputPrimary extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isPassword; // If true, shows obscured text (for passwords)
  final IconData? icon; // Optional icon to show inside the TextField
  final TextEditingController? controller;

  InputPrimary({
    required this.label,
    required this.placeholder,
    this.isPassword = false, // By default, it's not a password field
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Force RTL for Arabic support
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // TextField
          TextField(
            controller: controller,
            textAlign: TextAlign.right,
            obscureText: isPassword, // For password fields
            decoration: InputDecoration(
              hintText: placeholder, // Placeholder text
              hintStyle:
                  TextStyle(color: Color(0xffAAAAAA)), // Placeholder color
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: AppColors.border), // Unfocused border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color:
                        AppColors.border), // Focused border (same as unfocused)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color:
                        AppColors.border), // Enabled border (same as unfocused)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
