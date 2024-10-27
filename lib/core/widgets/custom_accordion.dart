import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';

class CustomAccordion extends StatelessWidget {
  final String title; // Title of the accordion
  final List<String> content; // List of content to display when expanded

  const CustomAccordion({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor:
            Colors.transparent, // Removes the line under the ExpansionTile
        iconTheme: IconThemeData(color: Colors.blue), // Sets the arrow color
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        iconColor: Colors.blue, // Arrow color when expanded
        collapsedIconColor: Colors.blue, // Arrow color when collapsed
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: content.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
