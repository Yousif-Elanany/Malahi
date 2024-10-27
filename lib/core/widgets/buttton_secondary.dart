import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class ButtonSecondary extends StatelessWidget {
  final String text; // Button text
  final Color textColor; // Text color
  final Color backgroundColor; // Background color
  final Color borderColor; // Border color
  final VoidCallback onPressed; // Callback function when button is pressed
  final double borderRadius; // Border radius
  final double padding; // Padding inside the button
  final IconData? icon; // Optional icon to show alongside the text

  ButtonSecondary({
    required this.text,
    this.textColor = const Color(0xffffffff), // Set default value as const
    this.backgroundColor =
        AppColors.secondary, // Use a constant value from AppColors
    this.borderColor = AppColors.secondary,
    required this.onPressed,
    this.borderRadius = 8.0, // Default border radius
    this.padding = 16.0, // Default padding
    this.icon, // Optional icon parameter
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the contents
          children: [
            if (icon != null) ...[
              // Check if icon is provided
              Icon(
                icon,
                color: textColor, // Icon color
                size: 20, // Set icon size
              ),
              SizedBox(width: 8), // Space between icon and text
            ],
            Text(
              text, // Button text
              style: TextStyle(
                color: textColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ), // Text color
            ),
          ],
        ),
      ),
    );
  }
}
