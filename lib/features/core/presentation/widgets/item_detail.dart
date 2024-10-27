import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String title;
  final String info;

  const ItemDetails({
    Key? key,
    this.title = '',
    this.info = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          info,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
      ],
    );
  }
}
