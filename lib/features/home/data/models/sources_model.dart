
import 'package:news/features/home/domain/entites/sources_entity.dart';

class SourcesModel {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  SourcesModel(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  factory SourcesModel.fromJson(Map<String, dynamic> json) {
    return SourcesModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      category: json['category'] ?? "",
      language: json['language'] ?? "",
      country: json['country'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = .new();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    data['category'] = category;
    data['language'] = language;
    data['country'] = country;
    return data;
  }

  SourcesEntity toEntity() {
    return SourcesEntity(
      id: id,
      name: name,
      description: description,
      url: url,
      category: category,
      language: language,
      country: country,
    );
  }
}
