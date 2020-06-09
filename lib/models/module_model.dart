import 'package:flutter/material.dart';
import 'package:my_academy/models/class_model.dart';

class Module {
  String title;
  String description;
  List<Class> classes;
  Module({@required this.title, @required this.description, @required classes});
}