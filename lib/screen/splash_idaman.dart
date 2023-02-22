import 'package:flutter/material.dart';
import 'package:idaman_bjb/screen/idaman_utama.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdamanSplash extends StatefulWidget {
  const IdamanSplash({super.key});

  @override
  State<IdamanSplash> createState() => _IdamanSplashState();
}

class _IdamanSplashState extends State<IdamanSplash> {
  String? alias;
  final _namaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _saveName(String nama) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nama);
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      alias = prefs.getString('name');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Nama Alias'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () async {
                      final name = _namaController.text;
                      await _saveName(name);
                      setState(() {
                        alias = name;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IdamanUtama(nama: name),
                        ),
                      );
                    },
                    child: const Text(
                      'Mulai',
                      style: TextStyle(fontSize: 30.0, fontFamily: 'Dongle'),
                    )),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
