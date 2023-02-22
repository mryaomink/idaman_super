class MediaCenterData {
  final int id;
  final String title;
  final String content;
  final String excerpt;
  final String yoastHead;

  MediaCenterData({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.yoastHead,
  });
  factory MediaCenterData.fromJson(Map<String, dynamic> json) {
    return MediaCenterData(
      id: json['id'],
      title: json['yoast_head_json']['title'],
      content: json['content']['rendered'],
      excerpt: json['excerpt']['rendered'],
      yoastHead: json['yoast_head_json']['og_image'][0]['url'],
    );
  }
}
