import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class DestinationDetail extends StatefulWidget {
  const DestinationDetail({super.key});

  @override
  State<DestinationDetail> createState() => _DestinationDetailState();
}

class _DestinationDetailState extends State<DestinationDetail> {
  List<Widget> detailPage = [
    const CardDesti(
      imgUrl:
          "https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      judul: "Solo Traveller",
      jarak: "100 m Dari Pusat Kota",
      desk: "Low Prize",
    ),
    const CardDesti(
      imgUrl:
          "https://images.unsplash.com/photo-1528543606781-2f6e6857f318?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80",
      judul: "Solo Traveller",
      jarak: "100 m Dari Pusat Kota",
      desk: "Low Prize",
    ),
    const CardDesti(
      imgUrl:
          "https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
      judul: "Solo Traveller",
      jarak: "100 m Dari Pusat Kota",
      desk: "Low Prize",
    ),
    const CardDesti(
      imgUrl:
          "https://images.unsplash.com/photo-1518684079-3c830dcef090?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      judul: "Solo Traveller",
      jarak: "100 m Dari Pusat Kota",
      desk: "Low Prize",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left_rounded,
              size: 40,
              color: Colors.amber,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       icon: const Icon(
              //         Icons.chevron_left,
              //         color: Colors.amber,
              //         size: 30.0,
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 4.0,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Text(
              //         'Back',
              //         style: TextStyle(
              //             fontSize: 40.0,
              //             fontFamily: 'Dongle',
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ],
              // ),
              Expanded(
                child: Swiper(
                  itemCount: detailPage.length,
                  itemBuilder: (context, index) {
                    return detailPage[index];
                  },
                  viewportFraction: 0.8,
                  scale: 0.5,
                  pagination: const SwiperPagination(),
                  controller: SwiperController(),
                  scrollDirection: Axis.horizontal,
                  duration: 1000,
                  curve: Curves.easeInOut,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height,
                  layout: SwiperLayout.TINDER,
                  fade: 0.5,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDesti extends StatelessWidget {
  final String imgUrl;
  final String judul;
  final String desk;
  final String jarak;
  const CardDesti({
    Key? key,
    required this.imgUrl,
    required this.judul,
    required this.desk,
    required this.jarak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        image:
            DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fitHeight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              desk,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              jarak,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
