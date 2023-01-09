import 'package:news_app/core/failure_succeses/exceptions.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/show_news/data/models/news_info_model.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

abstract class FetchFromRemoteDS {
  Future<List<NewsInfo>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  FetchFromRemoteDSImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<NewsInfo>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData();

      List list = data['articles'];
      List<Map<String, dynamic>> mapList = [];

      for (var i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<NewsInfoModel> news = [];
      for (var i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }

      return news;
    } catch (e) {
      throw const FetchExceptions(message: 'Failed to get data.');
    }
  }
}
