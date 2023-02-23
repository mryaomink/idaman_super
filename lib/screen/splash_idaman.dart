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

  void _saveName(
    BuildContext context,
  ) async {
    String name = _namaController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IdamanUtama(),
        ));
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_box_rounded),
                  hintText: 'Nama',
                  helperText: 'Masukkan Nama Panggilan',
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      _saveName(context);
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
