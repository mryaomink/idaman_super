import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IdamanSlider extends StatefulWidget {
  const IdamanSlider({super.key});

  @override
  State<IdamanSlider> createState() => _IdamanSliderState();
}

class _IdamanSliderState extends State<IdamanSlider> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/slider1.png',
    'assets/images/slider1.png',
    'assets/images/slider1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CarouselSlider(
            items: _images
                .map(
                  (image) => Container(
                    margin: const EdgeInsets.only(left: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 184,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(
                milliseconds: 800,
              ),
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
