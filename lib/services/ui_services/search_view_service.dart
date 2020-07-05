import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/courses_service.dart';

class SearchViewService implements DisposableBuildContext{
  CoursesService _coursesService = locator<CoursesService>();

  StreamController<List<Course>> _streamController = StreamController<List<Course>>();
  Stream<List<Course>> get streamToCourses => _streamController.stream;

  List<Course> _allCourses = [];
  List<Course> get allCourses => _allCourses;

  filter(String searchQuery) async {
    this._allCourses = await _coursesService.getAllCourses();
    List<Course> _filteredList =
        _allCourses.where((Course course) => course.title.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    _streamController.sink.add(_filteredList);
  }

  loadCourses() async {
    this._allCourses = await _coursesService.getAllCourses();
  }

  @override
  BuildContext get context => null;

  @override
  void dispose() {
    _streamController.close();
  }
}
