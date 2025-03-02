import 'package:geexar/core/constants/app_consts.dart';
import 'package:geexar/models/news_model.dart';
import 'package:geexar/core/services/api_service.dart';
import 'package:geexar/core/services/end_points.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository(this.apiService);

  Future<List<NewsModel>> fetchNews(String keyword) async {

    final response = await apiService.get(NewsEndPoints.everyThing, params: {
      "q": keyword,
      NewsEndPoints.sortBy: 'publishedAt',
      NewsEndPoints.pageSize: 10,
      NewsEndPoints.apiKey: AppConsts.apiKey, 
    });

    if (response.statusCode == 200) {
      return (response.data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception("Failed to fetch news");
    }
  }


  Future<List<NewsModel>> fetchCategoryNews(String category) async {
    final response = await apiService.get(NewsEndPoints.everyThing, params: {
      "q": category,
      NewsEndPoints.sortBy: 'relevancy',
      NewsEndPoints.pageSize: 10,
      NewsEndPoints.apiKey: AppConsts.apiKey,
    });

    if (response.statusCode == 200) {
      return (response.data['articles'] as List)
          .map((article) => NewsModel.fromJson(article))
          .toList();
    } else {
      throw Exception("Failed to fetch category news");
    }
  }
}
