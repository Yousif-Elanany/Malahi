import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart'; // Ensure this is the correct path to your AppColors

class Subtitle extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;

  const Subtitle({
    Key? key,
    required this.text,
    this.color = AppColors.primary, // Default value from AppColors
    this.textAlign = TextAlign.center, // Default alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexSansArabic(
        textStyle: const TextStyle(
          fontSize: 15, // Header H1 size
          fontWeight: FontWeight.w800, // Header H1 bold
          color: AppColors.textPrimary, // Default color
        ),
      ),
      textAlign: textAlign,
    );
  }
}
