import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  List<dynamic> _dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://mediacenter.banjarbarukota.go.id/wp-json/wp/v2/media'));

    if (response.statusCode == 200) {
      setState(() {
        _dataList = json.decode(response.body);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _dataList
          .map((data) => Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.network(
                  data['guid']['rendered'],
                  fit: BoxFit.cover,
                ),
              ))
          .toList(),
    );
  }
}
