import 'package:flutter/material.dart';

import 'module_model.dart';

class Course {
  String title;
  String description;
  List<Module> modules;
  Course({@required this.title, @required this.description, @required this.modules});
}