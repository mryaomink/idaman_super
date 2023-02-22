import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/splash_idaman.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const IdamanSplash(),
    );
  }
}
