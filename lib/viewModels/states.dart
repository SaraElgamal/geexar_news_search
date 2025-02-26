


import 'package:equatable/equatable.dart';
import 'package:geexar/models/news_model.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsModel> newsList1;
  final List<NewsModel> newsList2;

  NewsLoaded(this.newsList1, this.newsList2);

  @override
  List<Object?> get props => [newsList1, newsList2];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
