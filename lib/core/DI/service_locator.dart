import 'package:geexar/services/api_service.dart';
import 'package:geexar/services/news_repository.dart';
import 'package:geexar/viewModels/cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {

  
  sl.registerLazySingleton(() => ApiService());

  
  sl.registerLazySingleton(() => NewsRepository(sl<ApiService>()));



  sl.registerFactory(() => NewsCubit(sl<NewsRepository>()));

}
