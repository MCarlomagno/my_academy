import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/samples/sample_images.dart';
import 'package:my_academy/services/api/courses_service.dart';
import 'package:my_academy/services/api/users_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateCourseViewModel extends BaseViewModel {
  //service injection
  final NavigationService _navigationService = locator<NavigationService>();
  final CoursesService _coursesService = locator<CoursesService>();
  final UsersService _usersService = locator<UsersService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  onConfirm() async {
    setBusy(true);
    final _random = Random();
    var thumbnailImage = SampleImage.images[_random.nextInt(SampleImage.images.length)];
    var newCourse = Course(title: _titleController.text, description: _descriptionController.text,ownerUserId: _usersService.user.id, thumbnailImage: thumbnailImage);  
    newCourse = await _coursesService.createCourse(newCourse);
    CreateCourseDetailViewArguments createCourseDetailViewArguments = CreateCourseDetailViewArguments(courseId: newCourse.id);
    await _navigationService.replaceWith(Routes.createCourseDetailView, arguments: createCourseDetailViewArguments);
  }

  onCancel() {
    _navigationService.back(result: false);
  }
}