import 'package:flutter/material.dart';
import 'package:malahi_app/core/widgets/small_button.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';

class PackCoreWidget extends StatelessWidget {
  final PackModel pack;
  final VoidCallback onTap;

  const PackCoreWidget({
    Key? key,
    required this.pack,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              // borderRadius: BorderRadius.circular(10),
              child: Opacity(
                opacity: 0.1, // Fully visible image
                child: Image.network(
                  pack.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.black.withOpacity(0.0),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Title and Favorite Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          pack.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          pack.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: pack.isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ],
                  ),
                  // Row 2: Description
                  Text(
                    pack.description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Row 3: Four Sections of Text
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'المدينة',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              pack.city,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'التاريخ',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              pack.date,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'الطلبات',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              pack.orders,
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ]),
                  const Spacer(),
                  // Last Row: Button
                  SmallButton(
                    buttonText: 'الاطلاع على التذاكر',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
