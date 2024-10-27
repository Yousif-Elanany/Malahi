import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class HeaderSecond extends StatelessWidget {
  final String avatarUrl; // URL for the avatar image
  final String name; // Name to display
  final String subtitle; // Name to display

  const HeaderSecond({
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
          CircleAvatar(
            backgroundImage: avatarUrl.isNotEmpty
                ? NetworkImage(avatarUrl)
                : const AssetImage('assets/images/avatar.png') as ImageProvider,
            radius: 30.0,
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red,
            iconSize: 36,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
/* 

IconButton(
            icon: Icon(
                   Icons.favorite
              color:
                   Colors.red
            ),
            onPressed: () {
              // Handle favorite action
            },
          ),

 */