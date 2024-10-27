import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage("assets/images/bg-app.png"), // Your background image
          fit: BoxFit.cover, // Makes the image cover the entire screen
        ),
      ),
    );
  }
}
