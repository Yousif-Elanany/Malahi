import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/packs/domain/models/pack_model.dart';

import 'package:malahi_app/features/packs/domain/models/pack_model.dart';

class PackCarousel extends StatefulWidget {
  final List<PackModel> packs;

  const PackCarousel({Key? key, required this.packs}) : super(key: key);

  @override
  _PackCarouselState createState() => _PackCarouselState();
}

class _PackCarouselState extends State<PackCarousel> {
  int _currentIndex = 0; // Keep track of the current pack index

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/packs_search');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: widget.packs.length,
              itemBuilder: (context, index, realIdx) {
                final pack = widget.packs[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    height: 300, // Set height here
                    child: CachedNetworkImage(
                      imageUrl: pack.imageUrl,
                      fit: BoxFit
                          .cover, // Ensures image covers full height and width
                      width: double
                          .infinity, // Ensures image stretches to full width
                      height: double
                          .infinity, // Ensures image stretches to full height
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 300, // Set height to 300 here
                enlargeCenterPage: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update current index
                  });
                },
              ),
            ),
            Positioned(
              bottom: 0, // Adjust this value to move dots higher or lower
              left: 0,
              right: 0,
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.3), // Black with 0.1 opacity
                      Colors.black.withOpacity(
                          1.0), // Black with 1.0 opacity (fully opaque)
                    ],
                    begin: Alignment.topCenter, // Start gradient at the top
                    end: Alignment.bottomCenter, // End gradient at the bottom
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(20), // Bottom-left corner radius
                    bottomRight:
                        Radius.circular(20), // Bottom-right corner radius
                  ),
                ),
                child: Text(
                  'العروض',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40, // Adjust this value to move dots higher or lower
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.packs.map((ticket) {
                  int index = widget.packs.indexOf(ticket);
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _currentIndex == index
                          ? AppColors.secondary // Active color
                          : Colors.grey[300], // Inactive color
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: 2), // Space between lines
                    width: 6, // Width of the line
                    height: 6, // Height of the line
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
