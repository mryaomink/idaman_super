class MediaCenterData {
  final int id;
  final String title;
  final String content;
  final String excerpt;

  MediaCenterData({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
  });
  factory MediaCenterData.fromJson(Map<String, dynamic> json) {
    return MediaCenterData(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      excerpt: json['excerpt']['rendered'],
    );
  }
}
