import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String text; // Button text
  final Color textColor; // Text color
  final Color backgroundColor; // Background color
  final Color borderColor; // Border color
  final VoidCallback onPressed; // Callback function when button is pressed
  final double borderRadius; // Border radius
  final double padding; // Padding inside the button

  ButtonPrimary({
    required this.text,
    this.textColor = const Color(0xffffffff), // Set default value as const
    this.backgroundColor =
        AppColors.primary, // Use a constant value from AppColors
    this.borderColor = AppColors.primary,
    required this.onPressed,
    this.borderRadius = 8.0, // Default border radius
    this.padding = 16.0, // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
          foregroundColor: textColor, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor), // Border color
          ),
          padding: EdgeInsets.all(padding), // Padding
        ),
        onPressed: onPressed,
        child: Text(
          text, // Button text
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ), // Text color
        ),
      ),
    );
  }
}
