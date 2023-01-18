import 'package:news_app/core/failure_succeses/exceptions.dart';
import 'package:news_app/core/services_locator.dart';
import 'package:news_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/core/failure_succeses/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/show_news/domain/repositories/fecth_repo_contract.dart';

class FetchRepoImpl implements FetchRepo {
  final FetchFromRemoteDS fetchFromRemoteDS = sl<FetchFromRemoteDS>();

  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    try {
      return Right(await fetchFromRemoteDS.fetchNews(searchText));
    } on FetchExceptions catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
