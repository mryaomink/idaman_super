import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

import '../widget/detail_info.dart';

class IdamanCuaca extends StatefulWidget {
  const IdamanCuaca({super.key});

  @override
  State<IdamanCuaca> createState() => _IdamanCuacaState();
}

class _IdamanCuacaState extends State<IdamanCuaca> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: FutureBuilder<List<dynamic>>(
          future: _getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            if (snapshot.hasData) {
              List<dynamic> dataKota = snapshot.data;
              return ListView.builder(
                  itemCount: dataKota.length,
                  itemBuilder: (context, index) {
                    var item = dataKota[index];
                    return buildListKota(item);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<dynamic>> _getData() async {
    final response = await get(Uri.parse(
        'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-KalimantanSelatan.xml'));
    if (response.statusCode == 200) {
      final xmlString = response.body;
      final Xml2Json xml2json = Xml2Json();
      xml2json.parse(response.body);
      var json = xml2json.toGData();
      Map<String, dynamic> map = jsonDecode(json);
      return map['data']['forecast']['area'];
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  Widget buildListKota(item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => DetailInfo(
                title: item['description'],
                headerInfo: item['name'],
                infoData: item['parameter']))));
      },
      child: Card(
          child: ListTile(
        title: Text(
          item['description'],
        ),
        subtitle: Text(item['name'][1]['\$t'].toString()),
      )),
    );
  }
}

class HeaderCuaca extends StatelessWidget {
  const HeaderCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: const [
          Icon(Icons.radar),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Info Cuaca',
            style: TextStyle(fontFamily: "Dongle", fontSize: 24.0),
          )
        ],
      ),
    );
  }
}
