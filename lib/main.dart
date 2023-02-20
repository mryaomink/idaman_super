import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/idaman_utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idaman',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const IdamanUtama(),
    );
  }
}
