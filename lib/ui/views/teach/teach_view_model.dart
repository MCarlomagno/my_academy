import 'package:flutter/cupertino.dart';
import 'package:my_academy/api/courses_service.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:stacked/stacked.dart';

class TeachViewModel extends BaseViewModel {

  //service injection
  CoursesService _coursesService = locator<CoursesService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  onCreate() {
    print('on create invoked');
    Course course = Course(title: this._titleController.text, description: this.descriptionController.text);
    _coursesService.addCourse(course);
  }
}