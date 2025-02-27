import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geexar/models/news_model.dart';
import 'package:geexar/services/news_repository.dart';
import 'package:geexar/viewModels/states.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit(this.newsRepository) : super(NewsInitial());
  
 List<NewsModel> newsList1 = [];
  List<NewsModel> newsList2 = [];

  Future<void> fetchNews(String keyword) async {
    emit(NewsLoading());
    try {
       newsList1 = await newsRepository.fetchNews(keyword);
      emit(NewsLoaded(newsList1,newsList2));
    } catch (e) {
      emit(NewsError("Failed to load news: ${e.toString()}"));
    }
  }

  Future<void> fetchCategoryNews(String category) async {
    emit(NewsLoading());
    try {
       newsList2 = await newsRepository.fetchCategoryNews(category);
      emit(NewsLoaded( newsList1,newsList2));
    } catch (e) {
      emit(NewsError("Failed to load category news: ${e.toString()}"));
    }
  }

Future<void> updateListBySource(String source, bool isList1) async {
    emit(NewsLoading());
    try {
      List<NewsModel> relatedNews = await newsRepository.fetchNews(source);
      if (isList1) {
        newsList2 = relatedNews;
      } else {
        newsList1 = relatedNews;
      }
      emit(NewsLoaded(newsList1, newsList2));
    } catch (e) {
      emit(NewsError("Failed to fetch related news"));
    }
  }


}
