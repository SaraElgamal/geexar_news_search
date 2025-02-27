import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String title;
  final String description;
  final String? urlToImage;
   final String source;

  const NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
   required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      urlToImage: json['urlToImage'] ?? '',
      source: json['source']['name'] ?? 'Unknown',
    );
  }

  @override
  List<Object?> get props => [title, description, urlToImage,source];
}
