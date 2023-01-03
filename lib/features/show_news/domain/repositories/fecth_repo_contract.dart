import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure_succeses/failures.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}
