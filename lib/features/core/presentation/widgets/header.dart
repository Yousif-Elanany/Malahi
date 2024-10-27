import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class Header extends StatelessWidget {
  final String avatarUrl; // URL for the avatar image
  final String name; // Name to display
  final String subtitle; // Name to display

  const Header({
    Key? key,
    this.avatarUrl = '', // Default value for avatarUrl
    this.subtitle = 'مرحبا بعودتك', // Default value for avatarUrl
    required this.name, // Name is required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 10.0), // Adjusted padding
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the start
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: avatarUrl.isNotEmpty
                ? NetworkImage(avatarUrl)
                : const AssetImage('assets/images/avatar.png') as ImageProvider,
            radius: 30.0,
          ),
        ],
      ),
    );
  }
}
