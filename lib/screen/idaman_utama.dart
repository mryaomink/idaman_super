// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/ramal_cuaca.dart';
import 'package:idaman_bjb/screen/splash_idaman.dart';

import 'package:idaman_bjb/widget/banjartv_card.dart';
import 'package:idaman_bjb/widget/idaman_destination.dart';
import 'package:idaman_bjb/widget/idaman_slider.dart';
import 'package:idaman_bjb/widget/layanan_widget.dart';
import 'package:idaman_bjb/widget/media_center.dart';
import 'package:idaman_bjb/widget/menu_gridview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdamanUtama extends StatefulWidget {
  const IdamanUtama({
    Key? key,
  }) : super(key: key);

  @override
  State<IdamanUtama> createState() => _IdamanUtamaState();
}

class _IdamanUtamaState extends State<IdamanUtama> {
  String? _name;
  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_name == null) {
      return const IdamanSplash();
    } else {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopLayout(name: _name),
                const IdamanSlider(),
                const SizedBox(
                  height: 15.0,
                ),
                const BanjarTvCard(),
                const SizedBox(
                  height: 20.0,
                ),
                const RamalCuaca(),
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
}

class TopLayout extends StatelessWidget {
  const TopLayout({
    Key? key,
    required String? name,
  })  : _name = name,
        super(key: key);

  final String? _name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
                    _name!,
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
    );
  }
}
