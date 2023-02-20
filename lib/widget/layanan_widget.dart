import 'package:flutter/material.dart';

class LayananWidget extends StatelessWidget {
  const LayananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width,
      height: 356.0,
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
                'assets/images/laypublik.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'Layanan Publik',
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Card(
            color: const Color(0xffECECEC),
            child: ListTile(
              leading: Image.asset(
                'assets/images/iconizin.png',
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Layanan Perizinan',
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Dongle',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'DPMPTSP',
                style: TextStyle(fontFamily: 'Dongle', fontSize: 16.0),
              ),
              trailing: Image.asset('assets/images/arrow.png'),
            ),
          ),
          Card(
            color: const Color(0xffECECEC),
            child: ListTile(
              leading: Image.asset(
                'assets/images/kepen.png',
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Layanan Kependudukan',
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Disdukcapil',
                style: TextStyle(fontFamily: 'Dongle', fontSize: 16.0),
              ),
              trailing: Image.asset('assets/images/arrow.png'),
            ),
          ),
          Card(
            color: const Color(0xffECECEC),
            child: ListTile(
              leading: Image.asset(
                'assets/images/kesehatan.png',
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Layanan Kesehatan',
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Rumah Sakit Idaman',
                style: TextStyle(fontFamily: 'Dongle', fontSize: 16.0),
              ),
              trailing: Image.asset('assets/images/arrow.png'),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          const Text(
            'layanan lainnya >',
            style: TextStyle(
              fontFamily: 'Dongle',
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
