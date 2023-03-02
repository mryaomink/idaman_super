import 'package:flutter/material.dart';

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
              const Text(
                'Judul Halaman',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dongle'),
              ),
              const SizedBox(
                height: 60,
                child: Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s''',
                  style: TextStyle(fontSize: 18.0),
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
                    children: const [
                      MenuEmergency(
                          image: 'assets/images/polisi.png', judul: 'Polisi'),
                      MenuEmergency(
                          image: 'assets/images/fire.png', judul: 'Pemadam'),
                      MenuEmergency(
                          image: 'assets/images/rumahsakit.png',
                          judul: 'Rumah Sakit'),
                      MenuEmergency(
                          image: 'assets/images/pln.png', judul: 'PLN'),
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
