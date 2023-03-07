// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:idaman_bjb/screen/destination_detail.dart';

class IdamanDestination extends StatefulWidget {
  const IdamanDestination({super.key});

  @override
  State<IdamanDestination> createState() => _IdamanDestinationState();
}

class _IdamanDestinationState extends State<IdamanDestination> {
  List<String> imgW = [
    "assets/images/pinus.png",
    "assets/images/amanah.png",
    "assets/images/alaska.png",
  ];
  List<String> title = [
    "Wisata Hutan Pinus",
    "Amanah Borneo",
    "Alaska Park",
  ];
  List<String> ket = [
    "Wisata Hutan Pinus",
    "Amanah Borneo",
    "Alaska Park",
  ];
  List<String> jar = [
    "1.8 km dari kota",
    "2.0, km dari kota",
    "2.2, km dari kota",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 400.0,
      decoration: BoxDecoration(
        color: const Color(0xffFFFEFB),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/destinasi.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'Destinasi Favorit',
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListWisata(
                    imgUrl: imgW[index],
                    judul: title[index],
                    desk: ket[index],
                    jarak: jar[index],
                  );
                }),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DestinationDetail(),
                ),
              );
            },
            child: const Text(
              'selengkapnya',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class ListWisata extends StatelessWidget {
  const ListWisata({
    Key? key,
    required this.imgUrl,
    required this.judul,
    required this.desk,
    required this.jarak,
  }) : super(key: key);

  final String imgUrl;
  final String judul;
  final String desk;
  final String jarak;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          width: 200,
          height: MediaQuery.of(context).size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          width: 200.0,
          height: 110,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    15.0,
                  ),
                  bottomRight: Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                      fontFamily: 'Dongle',
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  desk,
                  style: const TextStyle(
                      fontFamily: 'Dongle',
                      color: Colors.white,
                      height: 1,
                      fontSize: 18.0),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  jarak,
                  style: const TextStyle(
                      fontFamily: 'Dongle',
                      color: Colors.white,
                      fontSize: 15.0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
