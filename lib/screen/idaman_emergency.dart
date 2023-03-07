import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IdamanEmergency extends StatelessWidget {
  const IdamanEmergency({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.amber,
                      size: 30.0,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: 'Dongle',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Selamat Datang Pada Layanan Darurat 112',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dongle',
                    height: 0.8),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 100,
                child: Text(
                  '''Layanan ini untuk melayani warga dalam situasi darurat pada kabupaten/kota yang telah memiliki layanan panggilan darurat 112. Program ini merupakan inisiatif Kemenkominfo untuk menyediakan panggilan darurat yang bebas pulsa.''',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 0.8,
                    padding: const EdgeInsets.all(20.0),
                    children: [
                      InkWell(
                        onTap: () async {
                          if (await Permission.phone.request().isGranted) {
                            await launchUrlString('tel:05114772533');
                          }
                        },
                        child: const MenuEmergency(
                            image: 'assets/images/polisi.png', judul: 'Polisi'),
                      ),
                      InkWell(
                        onTap: () async {
                          if (await Permission.phone.request().isGranted) {
                            await launchUrlString('tel:081349443170');
                          }
                        },
                        child: const MenuEmergency(
                            image: 'assets/images/fire.png', judul: 'Pemadam'),
                      ),
                      InkWell(
                        onTap: () async {
                          if (await Permission.phone.request().isGranted) {
                            await launchUrlString('tel:05116749696');
                          }
                        },
                        child: const MenuEmergency(
                            image: 'assets/images/rumahsakit.png',
                            judul: 'Rumah Sakit'),
                      ),
                      InkWell(
                        onTap: () async {
                          if (await Permission.phone.request().isGranted) {
                            await launchUrlString('tel:05114773268');
                          }
                        },
                        child: const MenuEmergency(
                            image: 'assets/images/pln.png', judul: 'PLN'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuEmergency extends StatelessWidget {
  final String image;
  final String judul;
  const MenuEmergency({
    Key? key,
    required this.image,
    required this.judul,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color.fromARGB(255, 217, 212, 212),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          judul,
          style: const TextStyle(fontSize: 32.0, fontFamily: 'Dongle'),
        )
      ],
    );
  }
}

class PoliceEmergency extends StatelessWidget {
  const PoliceEmergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(itemBuilder: (context, index) {
          return const ListTile();
        }))
      ],
    );
  }
}
