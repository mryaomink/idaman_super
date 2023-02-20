import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MediaCenter extends StatefulWidget {
  const MediaCenter({super.key});

  @override
  State<MediaCenter> createState() => _MediaCenterState();
}

class _MediaCenterState extends State<MediaCenter> {
  int _currentIndex = 0;
  final List<String> _images = [
    "assets/images/sliderbanner.png",
    "assets/images/sliderbanner.png",
    "assets/images/sliderbanner.png",
    "assets/images/sliderbanner.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xffFFFEFB),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/news.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Media Center',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontFamily: 'Dongle',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        fit: BoxFit.contain,
                        width: 374.0,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
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
        const Padding(
          padding: EdgeInsets.only(right: 24.0),
          child: Text(
            'selengkapnya >',
            style: TextStyle(
                fontFamily: 'Dongle',
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
