import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

// https://pub.dev/packages/json_serializable
// https://www.youtube.com/watch?v=v5xGLrhzDGE
//https://www.btkakademi.gov.tr/portal/course/player/deliver/google-flutter-ile-mobil-uygulama-kursu-10150
part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  String categoryName;
  String seoUrl;
  Category({
    required this.id,
    required this.categoryName,
    required this.seoUrl,
  });

  Category copyWith({
    int? id,
    String? categoryName,
    String? seoUrl,
  }) {
    return Category(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      seoUrl: seoUrl ?? this.seoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
      'seoUrl': seoUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt() ?? 0,
      categoryName: map['categoryName'] ?? '',
      seoUrl: map['seoUrl'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Category.fromJson(String source) =>
  //     Category.fromMap(json.decode(source));

  // String toJson() => json.encode(toMap());
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  // factory DiziModel.fromJson(String source) =>
  //     DiziModel.fromMap(json.decode(source));

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  @override
  String toString() =>
      'Category(id: $id, categoryName: $categoryName, seoUrl: $seoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.seoUrl == seoUrl;
  }

  @override
  int get hashCode => id.hashCode ^ categoryName.hashCode ^ seoUrl.hashCode;
}
