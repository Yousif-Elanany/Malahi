// lib/features/splash/presentation/widgets/dots_indicator.dart
import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int dotCount;
  final int currentIndex;

  const DotsIndicator({
    Key? key,
    required this.dotCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.primary : AppColors.gray,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
