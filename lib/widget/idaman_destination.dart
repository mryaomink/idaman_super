import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/destination_detail.dart';

class IdamanDestination extends StatefulWidget {
  const IdamanDestination({super.key});

  @override
  State<IdamanDestination> createState() => _IdamanDestinationState();
}

class _IdamanDestinationState extends State<IdamanDestination> {
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
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 200,
                        height: MediaQuery.of(context).size.height,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                            fit: BoxFit.fitHeight,
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
                            children: const [
                              Text(
                                'Danau Seran',
                                style: TextStyle(
                                    fontFamily: 'Dongle',
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Wisata danau buatan yang indah\ndengan pulau terpencil',
                                style: TextStyle(
                                    fontFamily: 'Dongle',
                                    color: Colors.white,
                                    height: 1,
                                    fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                '2.8 km dari pusat kota',
                                style: TextStyle(
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
