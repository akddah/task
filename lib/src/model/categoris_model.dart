// To parse this JSON data, do
//
//     final allCategorisModel = allCategorisModelFromJson(jsonString);

import 'dart:convert';

AllCategorisModel allCategorisModelFromJson(String str) =>
    AllCategorisModel.fromJson(json.decode(str));

class AllCategorisModel {
  AllCategorisModel({
    this.message,
    this.data,
  });

  String message;
  List<Category> data;

  factory AllCategorisModel.fromJson(Map<String, dynamic> json) =>
      AllCategorisModel(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Category>.from(
                json["data"].map((x) => Category.fromJson(x))),
      );
}

class Category {
  Category({
    this.id,
    this.image,
    this.slug,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.name,
    this.description,
    this.categories,
  });

  int id;
  String image;
  String slug;
  bool selected = false;
  String categoryId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String type;
  String name;
  String description;
  List<Category> categories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        slug: json["slug"] == null ? null : json["slug"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
      );
}
