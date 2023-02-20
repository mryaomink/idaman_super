import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/idaman_bapok.dart';
import 'package:idaman_bjb/screen/idaman_cctv.dart';
import 'package:idaman_bjb/screen/idaman_emergency.dart';
import 'package:idaman_bjb/screen/idaman_lainnya.dart';
import 'package:idaman_bjb/screen/idaman_lapor.dart';
import 'package:idaman_bjb/screen/idaman_penerbangan.dart';
import 'package:idaman_bjb/screen/idaman_ppid.dart';
import 'package:idaman_bjb/screen/satu_data.dart';

class MenuGridview extends StatelessWidget {
  const MenuGridview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgMenu = [
      "assets/images/emergency.png",
      "assets/images/lapor.png",
      "assets/images/cctv.png",
      "assets/images/ppid.png",
      "assets/images/satudata.png",
      "assets/images/infopenerbangan.png",
      "assets/images/bahanpokok.png",
      "assets/images/lainnya.png",
    ];

    final List<String> judulMenu = [
      "Emergency",
      "Lapor",
      "CCTV Kota",
      "PPID",
      "Satu Data",
      "Info Penerbangan",
      "Harga Bahan Pokok",
      "Aplikasi Lainnya",
    ];

    final List<Widget> pagesMenu = [
      const IdamanEmergency(),
      const IdamanLapor(),
      const IdamanCctv(),
      const IdamanPpid(),
      const SatuData(),
      const IdamanPenerbangan(),
      const IdamanBapok(),
      const IdamanLainnya(),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: imgMenu.length,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pagesMenu[index]));
                },
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 238, 233),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset(
                    imgMenu[index],
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                judulMenu[index],
                style: const TextStyle(
                  fontFamily: 'Dongle',
                  fontSize: 16.0,
                  height: 0.9,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
