// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/idaman_utama.dart';

import 'package:idaman_bjb/screen/splash_idaman.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if name is already set
  bool isNameSet = prefs.containsKey('name');
  runApp(MyApp(goHome: isNameSet));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    this.goHome = false,
  }) : super(key: key);

  final bool goHome;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idaman',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: goHome ? const IdamanUtama() : const IdamanSplash(),
    );
  }
}
