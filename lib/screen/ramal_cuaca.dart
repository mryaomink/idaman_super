import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class MyApiService {
  static const apiKey = '1234567';
  Future<List<dynamic>> fetchData() async {
    final response = await http.post(
        Uri.parse('https://diskopukmnaker.banjarbarukota.go.id/cuacaku/'),
        body: {
          'password': 'banjarbarujuara',
        });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Kada kawa ma ambil data dari Server');
    }
  }
}

class RamalCuaca extends StatefulWidget {
  const RamalCuaca({super.key});

  @override
  State<RamalCuaca> createState() => _RamalCuacaState();
}

class _RamalCuacaState extends State<RamalCuaca> {
  final _apiService = MyApiService();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: FutureBuilder(
            future: _apiService.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Prakiraan Cuaca Hari ini Kota Banjarbaru',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: 'Dongle'),
                    ),
                    SizedBox(
                      height: 135,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final myData = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  LottieBuilder.network(
                                    myData['icon'],
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text(myData['waktu']),
                                  Text(myData['keterangan']),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '${myData['temperatur']['0']} °C',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
