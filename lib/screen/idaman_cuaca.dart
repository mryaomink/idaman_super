// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:idaman_bjb/models/cuaca_bjb.dart';
// import 'package:xml2json/xml2json.dart';

// import '../widget/detail_info.dart';

// class IdamanCuaca extends StatefulWidget {
//   const IdamanCuaca({super.key});

//   @override
//   State<IdamanCuaca> createState() => _IdamanCuacaState();
// }

// class _IdamanCuacaState extends State<IdamanCuaca> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200.0,
//       child: FutureBuilder(
//           future: _getData(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             if (snapshot.hasData) {
//               List<String> dataKota = snapshot.data;
//               return ListView.builder(
//                   itemCount: dataKota.length,
//                   itemBuilder: (context, index) {
//                     return SizedBox(
//                       height: 80,
//                       child: Text(dataKota[index]),
//                     );
//                   });
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }

//   Future<List<dynamic>> _getData() async {
//     final response = await get(Uri.parse(
//         'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanSelatan.xml'));
//     if (response.statusCode == 200) {
//       final xmlString = response.body;
//       final Xml2Json xml2json = Xml2Json();
//       xml2json.parse(response.body);
//       var json = xml2json.toGData();
//       Map<String, dynamic> map = jsonDecode(json);
//       return map['data']['forecast']['area'];
//     } else {
//       throw Exception('Gagal mengambil data dari API');
//     }
//   }

//   Future<String> _infoCuaca() async {
//     final response = await get(Uri.parse(
//         'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanSelatan.xml'));
//     if (response.hashCode == 200) {
//       final xmlString = response.body;
//       final Xml2Json xml2json = Xml2Json();
//       xml2json.parse(xmlString);
//       final jsonString = xml2json.toParker();
//       final jsonData = jsonDecode(jsonString);
//       final banjarbaru = jsonData['data']['forecast']['area'].firstWhere(
//           (area) => area['description'] == 'Banjarbaru',
//           orElse: () => null);
//       final dataCuacaBjb = banjarbaru?['parameter']
//           .where((parameter) => parameter['id'] == 'weather')
//           .map((parameter) => parameter['description'])
//           .join('\n');
//       return dataCuacaBjb ?? 'Data tidak ditemukan';
//     } else {
//       throw Exception('Gagal Mengambil Data dari Server BMKG');
//     }
//   }

//   Widget buildListKota(item) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: ((context) => DetailInfo(
//                 title: item['description'],
//                 headerInfo: item['name'],
//                 infoData: item['parameter']))));
//       },
//       child: Card(
//           child: ListTile(
//         title: Text(
//           item['description'],
//         ),
//         subtitle: Text(item['name'][1]['\$t'].toString()),
//       )),
//     );
//   }
// }

// class HeaderCuaca extends StatelessWidget {
//   const HeaderCuaca({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         children: const [
//           Icon(Icons.radar),
//           SizedBox(
//             width: 10.0,
//           ),
//           Text(
//             'Info Cuaca',
//             style: TextStyle(fontFamily: "Dongle", fontSize: 24.0),
//           )
//         ],
//       ),
//     );
//   }
// }

// class InfoCuaca extends StatefulWidget {
//   const InfoCuaca({super.key});

//   @override
//   State<InfoCuaca> createState() => _InfoCuacaState();
// }

// class _InfoCuacaState extends State<InfoCuaca> {
//   late Future<List<CuacaBjb>> cuacaBjb;
//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<CuacaData> fetchCuaca() async {
//     final response = await http.get(
//       Uri.parse('https://ibnux.github.io/BMKG-importer/cuaca/501324.json'),
//     );
//     if (response.statusCode == 200) {
//       return CuacaData.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Gagal mengambil Data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220.0,
//       child: FutureBuilder<List<CuacaBjb>>(
//           future: cuacaBjb,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text('tes');
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }

// class CuacaData {
//   final String jamCuaca;
//   final String kodeCuaca;
//   final String cuaca;
//   final String humidity;
//   final String tempC;
//   final String tempF;

//   CuacaData(
//       {required this.jamCuaca,
//       required this.kodeCuaca,
//       required this.cuaca,
//       required this.humidity,
//       required this.tempC,
//       required this.tempF});

//   factory CuacaData.fromJson(Map<String, dynamic> json) {
//     return CuacaData(
//         jamCuaca: json['jamCuaca'][0],
//         kodeCuaca: json['kodeCuaca'][0],
//         cuaca: json['cuaca'][0],
//         humidity: json['humidity'][0],
//         tempC: json['tempC'][0],
//         tempF: json['tempF'][0]);
//   }
// }
