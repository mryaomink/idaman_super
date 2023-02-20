import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/banjarbaru_tv.dart';

class BanjarTvCard extends StatelessWidget {
  const BanjarTvCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BanjarbaruTv()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: MediaQuery.of(context).size.width,
        height: 93,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xffE0EAA2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/info.png',
              fit: BoxFit.cover,
              width: 40.0,
              height: 40.0,
            ),
            const SizedBox(
              width: 9.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BANJARBARU.TV',
                  style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Saat ini sedang Live! “ACARA\nPUNCAK PERINGATAN HARI JADI BANJARBARU”',
                  style: TextStyle(
                      fontFamily: 'Dongle',
                      fontSize: 20,
                      color: Colors.black,
                      height: 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
