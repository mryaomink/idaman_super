import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:idaman_bjb/models/media_center.dart';
import 'package:idaman_bjb/screen/media_center_news.dart';

class MediaCenter extends StatefulWidget {
  const MediaCenter({super.key});

  @override
  State<MediaCenter> createState() => _MediaCenterState();
}

class _MediaCenterState extends State<MediaCenter> {
  late Future<List<MediaCenterData>> mediaPost;
  Future<List<MediaCenterData>> _fetchPosts() async {
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
  void initState() {
    super.initState();
    mediaPost = _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xffFFFEFB),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/news.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Media Center',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontFamily: 'Dongle',
                      fontWeight: FontWeight.bold,
                      height: 0.7),
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 180.0,
              child: FutureBuilder<List<MediaCenterData>>(
                future: mediaPost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final post = snapshot.data![index];

                        // return Card(
                        //   color: const Color.fromARGB(60, 201, 195, 195),
                        //   elevation: 0,
                        //   child: ListTile(
                        //     contentPadding: const EdgeInsets.all(15.0),
                        // title:
                        //     subtitle: Padding(
                        //       padding: const EdgeInsets.only(top: 16.0),
                        //       child: Text(parse((post.excerpt).toString())
                        //           .documentElement!
                        //           .text),
                        //     ),
                        //   ),
                        // );
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  post.yoastHead,
                                  fit: BoxFit.fitWidth,
                                  width: 284,
                                  height: 147,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.white.withOpacity(0.7),
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  post.title,
                                  style: const TextStyle(
                                      fontFamily: 'Dongle',
                                      fontSize: 20.0,
                                      overflow: TextOverflow.ellipsis,
                                      height: 0.9),
                                  maxLines: 2,
                                ),
                              ),
                              // Text(
                              //   parse((post.excerpt).toString())
                              //       .documentElement!
                              //       .text,
                              //   style: const TextStyle(
                              //       fontSize: 18, fontFamily: 'Dongle'),
                              //   maxLines: 2,
                              // ),
                            ],
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
            )),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MediaCenterNews(),
                  ));
            },
            child: const Text(
              'selengkapnya >',
              style: TextStyle(
                  fontFamily: 'Dongle',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
