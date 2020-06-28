import 'package:flutter/material.dart';
import 'package:my_academy/models/class_model.dart';

class Module {
  int id;
  int courseId;
  String title;
  String description;
  List<Class> classes;
  Module({this.id, @required this.title, @required this.description, @required this.courseId, this.classes,});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "courseId": this.courseId,
      "title": this.title,
      "description": this.description,
    };
  }
}
