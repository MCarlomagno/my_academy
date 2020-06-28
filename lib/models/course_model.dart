import 'package:flutter/material.dart';
import 'package:my_academy/models/module_model.dart';

class Course {
  int id;
  int ownerUserId;
  String title;
  String description;
  List<Module> modules;
  Course({this.id, @required this.title, @required this.description, @required this.ownerUserId});

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "ownerUserId": this.ownerUserId,
      "title": this.title,
      "description": this.description,
    };
  }
}
