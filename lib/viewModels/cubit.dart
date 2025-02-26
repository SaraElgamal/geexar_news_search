import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geexar/services/news_repository.dart';
import 'package:geexar/viewModels/states.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit(this.newsRepository) : super(NewsInitial());

  Future<void> fetchNews(String keyword) async {
    emit(NewsLoading());
    try {
      final newsList = await newsRepository.fetchNews(keyword);
      emit(NewsLoaded(newsList, []));
    } catch (e) {
      emit(NewsError("Failed to load news: ${e.toString()}"));
    }
  }

  Future<void> fetchCategoryNews(String category) async {
    emit(NewsLoading());
    try {
      final newsList = await newsRepository.fetchCategoryNews(category);
      emit(NewsLoaded([], newsList));
    } catch (e) {
      emit(NewsError("Failed to load category news: ${e.toString()}"));
    }
  }
}
