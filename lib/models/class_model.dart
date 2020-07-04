import 'package:flutter/material.dart';

class Class {
  int id;
  int moduleId;
  String title;
  String description;
  String videoUrl;
  String thumbnailImage;
  Class({this.id, this.moduleId, @required this.title, @required this.description, @required this.videoUrl, @required this.thumbnailImage});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "moduleId": this.moduleId,
      "title": this.title,
      "description": this.description,
      "videoUrl": this.videoUrl,
      "thumbnailImage": this.thumbnailImage
    };
  }

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'] as int,
      moduleId: json['moduleId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      videoUrl: json['videoUrl'] as String,
      thumbnailImage: json['thumbnailImage'] as String
    );
  }
}
