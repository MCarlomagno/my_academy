import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassEditViewModel extends BaseViewModel {
  //service injection
  NavigationService _navigationService = locator<NavigationService>();
  VideoDataService _videoDataService = locator<VideoDataService>();
  ClassesService _classesService = locator<ClassesService>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => this._titleController;

  TextEditingController _descriptionCotroller = TextEditingController();
  TextEditingController get descriptionController => this._descriptionCotroller;

  int _moduleId;

  onConfirm() async {
    var condicion = _videoDataService.videoPath != null &&
        _titleController.text.isNotEmpty &&
        _descriptionCotroller.text.isNotEmpty;
    print('path: ' + _videoDataService.videoPath.toString());
    print('condicion: ' + condicion.toString());
    if (_videoDataService.videoPath != null &&
        _titleController.text.isNotEmpty &&
        _descriptionCotroller.text.isNotEmpty) {
      setBusy(true);
      Class currentClass = Class(
          moduleId: this._moduleId,
          title: _titleController.text,
          description: _descriptionCotroller.text,
          videoUrl: _videoDataService.videoPath);
      print('agregando clases a modulo');
      await _classesService.createClass(currentClass);
      setBusy(false);
      _navigationService.back(result: true);
    }
  }

  onModelReady(int moduleId) {
    this._moduleId = moduleId;
  }
}
