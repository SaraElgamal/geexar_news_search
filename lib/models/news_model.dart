class NewsModel {
  final String title;
  final String description;
  final String url;
  final String? imageUrl;
  final String category;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
     required this.category,
    this.imageUrl,

  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      category: json['category'] ?? 'general',
      imageUrl: json['urlToImage'],
    );
  }
}
