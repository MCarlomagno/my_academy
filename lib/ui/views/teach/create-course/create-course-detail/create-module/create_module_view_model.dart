import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateModuleViewModel extends BaseViewModel {
  //service injection
  final NavigationService _navigationService = locator<NavigationService>();
  final ModulesService _modulesService = locator<ModulesService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  int _courseId;

  onConfirm() async {
    setBusy(true);
    var newModule = Module(title: _titleController.text, description: _descriptionController.text, courseId: this._courseId);  
    await _modulesService.createModule(newModule);
    setBusy(false);
    _navigationService.back(result: true);
  }

  onModelReady(int courseId) {
    this._courseId = courseId;
  }
}