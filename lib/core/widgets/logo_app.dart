import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsets margin;

  const LogoApp({
    Key? key,
    this.height = 150, // Default height
    this.width = 150, // Default width
    this.margin = const EdgeInsets.only(top: 20), // Default margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // You can adjust this value when calling the widget
      child: Image.asset(
        'assets/images/logo.png', // Replace with your actual logo image path
        height: height, // Adjust height as needed
        width: width, // Adjust width as needed
      ),
    );
  }
}
