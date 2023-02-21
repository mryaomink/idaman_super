import 'dart:convert';
import 'package:html/parser.dart';

import 'package:flutter/material.dart';
import 'package:idaman_bjb/models/media_center.dart';

import 'package:http/http.dart' as http;

class MediaCenterNews extends StatefulWidget {
  const MediaCenterNews({super.key});

  @override
  State<MediaCenterNews> createState() => _MediaCenterNewsState();
}

class _MediaCenterNewsState extends State<MediaCenterNews> {
  late Future<List<MediaCenterData>> mediaPost;

  @override
  void initState() {
    super.initState();
    mediaPost = ambilData();
  }

  Future<List<MediaCenterData>> ambilData() async {
    final response = await http.get(Uri.parse(
        'https://mediacenter.banjarbarukota.go.id/wp-json/wp/v2/posts'));
    if (response.statusCode == 200) {
      final fetch = jsonDecode(response.body);
      return fetch
          .map<MediaCenterData>((json) => MediaCenterData.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to get Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 8,
            child: FutureBuilder<List<MediaCenterData>>(
              future: mediaPost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = snapshot.data![index];
                      return Card(
                        color: const Color.fromARGB(60, 201, 195, 195),
                        elevation: 0,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15.0),
                          title: Text(
                            snapshot.data![index].title,
                            style: const TextStyle(
                                fontFamily: 'Dongle',
                                fontSize: 25.0,
                                height: 0.7),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(parse((post.excerpt).toString())
                                .documentElement!
                                .text),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
