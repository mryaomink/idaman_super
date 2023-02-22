// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:idaman_bjb/widget/banjartv_card.dart';
import 'package:idaman_bjb/widget/idaman_destination.dart';
import 'package:idaman_bjb/widget/idaman_slider.dart';
import 'package:idaman_bjb/widget/layanan_widget.dart';
import 'package:idaman_bjb/widget/media_center.dart';
import 'package:idaman_bjb/widget/menu_gridview.dart';

class IdamanUtama extends StatelessWidget {
  final String nama;

  const IdamanUtama({
    Key? key,
    required this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1557053910-d9eadeed1c58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                        ),
                        const SizedBox(
                          width: 19.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Bertaktifitas,',
                              style: TextStyle(
                                  fontFamily: 'Dongle',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  height: 0.7),
                            ),
                            Text(
                              nama,
                              style: const TextStyle(
                                  fontFamily: 'Dongle',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  height: 0.7),
                            )
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/bell.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const IdamanSlider(),
              const SizedBox(
                height: 15.0,
              ),
              const BanjarTvCard(),
              const SizedBox(
                height: 15.0,
              ),
              const LayananWidget(),
              const Divider(
                thickness: 10,
                color: Color(0xffECECEC),
              ),
              const MediaCenter(),
              const SizedBox(
                height: 20.0,
              ),
              const MenuGridview(),
              const Divider(
                thickness: 10,
                color: Color(0xffECECEC),
              ),
              const IdamanDestination(),
            ],
          ),
        ),
      ),
    );
  }
}
