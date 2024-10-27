import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class SectionWithButton extends StatelessWidget {
  final String sectionTitle;
  final String buttonText;
  final IconData buttonIcon;
  final VoidCallback onPressed;

  const SectionWithButton({
    Key? key,
    required this.sectionTitle,
    this.buttonText = 'راية الكل',
    this.buttonIcon = Icons.arrow_forward,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              sectionTitle,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Elevated Button with Icon on the left and Text on the right
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(buttonIcon), // Icon on the left
            iconAlignment: IconAlignment.end,
            label: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              iconColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
