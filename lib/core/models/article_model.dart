import 'package:news/core/models/articles_model.dart';
import 'package:news/core/entites/article_entity.dart';

class ArticleModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;

  ArticleModel({this.status, this.totalResults, this.articles});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesModel>[];
      json['articles'].forEach((v) {
        articles!.add(ArticlesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = .new();
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      status: status,
      totalResults: totalResults,
      articles: articles?.map((e) => e.toEntity()).toList(),
    );
  }
}