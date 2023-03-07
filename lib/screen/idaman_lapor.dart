import 'package:flutter/material.dart';

class IdamanLapor extends StatelessWidget {
  const IdamanLapor({super.key});

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
      body: Column(
        children: const [
          Center(
              child: Text(
            'Coming Soon',
            style: TextStyle(fontFamily: 'Dongle', fontSize: 40.0),
          ))
        ],
      ),
    );
  }
}
