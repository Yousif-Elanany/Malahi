import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final VoidCallback onPressed;

  const SmallButton({
    Key? key,
    this.buttonText = 'راية الكل',
    this.buttonIcon = Icons.arrow_forward,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            'assets/svg/pack.svg',
            width: 14,
          ), // Icon on the left
          iconAlignment: IconAlignment.end,
          label: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
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
      ),
    );
  }
}
