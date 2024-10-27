import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:malahi_app/core/constants/app_colors.dart';
import 'package:malahi_app/features/home/domain/models/slide_model.dart';

class SlideCarousel extends StatefulWidget {
  final List<SlideModel> slides;

  const SlideCarousel({Key? key, required this.slides}) : super(key: key);

  @override
  _SlideCarouselState createState() => _SlideCarouselState();
}

class _SlideCarouselState extends State<SlideCarousel> {
  int _currentIndex = 0; // Keep track of the current slide index

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      // height: 165,
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: widget.slides.length,
            itemBuilder: (context, index, realIdx) {
              final slide = widget.slides[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: slide.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              height: 200,
              // enlargeCenterPage: true,
              enlargeCenterPage: false,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              enlargeFactor: 0.2,
              aspectRatio: 18 / 16,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // Update current index
                });
              },
            ),
          ),
          // Navigation lines
          Positioned(
            bottom: 10, // Adjust this value to move dots higher or lower
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.slides.map((slide) {
                int index = widget.slides.indexOf(slide);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _currentIndex == index
                        ? AppColors.primary // Active color
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
    );
  }
}
