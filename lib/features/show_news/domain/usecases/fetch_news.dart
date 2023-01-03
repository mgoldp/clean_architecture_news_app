import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure_succeses/failures.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/features/show_news/domain/repositories/fecth_repo_contract.dart';

class FetchNewsUsecase {
  FetchNewsUsecase({required this.fetchRepo});

  final FetchRepo fetchRepo;

  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) {
    return fetchRepo.fetchNews(searchText);
  }
}
