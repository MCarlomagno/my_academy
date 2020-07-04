import 'package:flutter/material.dart';
import 'package:my_academy/models/module_model.dart';

class Course {
  int id;
  int ownerUserId;
  String title;
  String description;
  List<Module> modules;
  String thumbnailImage;
  Course({this.id, @required this.title, @required this.description, @required this.ownerUserId, this.modules, @required this.thumbnailImage});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "ownerUserId": this.ownerUserId,
      "title": this.title,
      "description": this.description,
      "thumbnailImage": this.thumbnailImage
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      ownerUserId: json['ownerUserId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      modules: [],
    );
  }
}
