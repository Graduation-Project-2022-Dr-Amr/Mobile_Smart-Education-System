
import 'package:login_signin/data/api/api_constants.dart';
import 'package:login_signin/data/api/dio_helper.dart';
import 'package:login_signin/data/models/lessons.dart';

class NewsRepository {
  static Future<List<Lesson>> getAllArticles({required String category}) async {
    final articles = await DioHelper.getData(
        query: {'country': 'eg', 'category': category, 'apiKey': apiKey});
    return articles.map((article) => Lesson.fromJson(article)).toList();
  }

  static Future<List<Lesson>> getSearchedLessons(String keyWord) async {
    final articles = await DioHelper.getSearchedData(
        query: {'q': keyWord, 'apiKey': apiKey, 'sortBy': 'publishedAt'});
    return articles.map((article) => Lesson.fromJson(article)).toList();
  }
}
