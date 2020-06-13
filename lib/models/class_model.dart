import 'package:flutter/material.dart';

class Class {
  int id;
  int moduleId;
  String title;
  String description;
  String videoUrl;
  Class({this.id, this.moduleId, @required this.title, @required this.description, @required this.videoUrl});
}
