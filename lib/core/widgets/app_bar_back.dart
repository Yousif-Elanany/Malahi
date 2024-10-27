import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Makes the background transparent
      elevation: 0, // Removes the shadow or elevation
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black, // Custom back icon color
        ),
        onPressed: () {
          Navigator.pop(context); // Handles back navigation
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
