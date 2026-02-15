import 'package:news/features/home/data/models/sources_model.dart';
import 'package:news/features/home/domain/entites/source_entity.dart';

class SourceModel {
  String? status;
  List<SourcesModel>? sources;

  SourceModel({this.status, this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      status: json['status'],
      sources: json['sources'] != null
          ? (json['sources'] as List<dynamic>)
                .map((v) => SourcesModel.fromJson(v as Map<String, dynamic>))
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = .new();
    data['status'] = status;
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  SourceEntity toEntity() {
    return SourceEntity(
      status: status,
      sources: sources?.map((e) => e.toEntity()).toList(),
    );
  }
}
