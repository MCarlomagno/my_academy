import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/sample_database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateCourseViewModel extends BaseViewModel {
  //service injection
  final SampleDataBase _sampleDataBase = locator<SampleDataBase>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CoursesService _coursesService = locator<CoursesService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  onConfirm() async {
    setBusy(true);
    var newCourse = Course(title: _titleController.text, description: _descriptionController.text,ownerUserId: _sampleDataBase.currentUserId);  
    newCourse = await _coursesService.createCourse(newCourse);
    CreateCourseDetailViewArguments createCourseDetailViewArguments = CreateCourseDetailViewArguments(courseId: newCourse.id);
    await _navigationService.navigateTo(Routes.createCourseDetailView, arguments: createCourseDetailViewArguments);
    setBusy(false);
  }
}