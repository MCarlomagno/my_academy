import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ModuleDetailViewModel extends BaseViewModel {
  /// service injection
  ClassesService _classesService = locator<ClassesService>();
  NavigationService _navigationService = locator<NavigationService>();

  List<Class> _classes;
  List<Class> get classes => this._classes;

  Module _module;

  onModelReady(Module module) async {
    setBusy(true);
    this._module = module;
    this._classes = await _classesService.getClassesByModuleId(module.id);
    setBusy(false);
  }

  createClass(Key key) async {
    ClassEditViewArguments classEditViewArguments = ClassEditViewArguments(key: key, moduleId: this._module.id);
    bool result = await _navigationService.navigateTo(Routes.classEditView, arguments: classEditViewArguments);
    if (result != null && result) {
      setBusy(true);
      this._classes = await _classesService.getClassesByModuleId(this._module.id);
      setBusy(false);
    }
  }
}
