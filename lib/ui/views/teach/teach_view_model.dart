import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TeachViewModel extends BaseViewModel {

  //service injection
    final NavigationService _navigationService = locator<NavigationService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  onCreate() async {
     await _navigationService.navigateTo(Routes.createCourseView);
  }
}