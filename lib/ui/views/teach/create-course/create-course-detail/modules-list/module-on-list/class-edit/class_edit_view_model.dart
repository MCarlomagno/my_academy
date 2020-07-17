
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/samples/sample_images.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/api/cloudinary/cloudinary_service.dart';
import 'package:my_academy/services/api/cloudinary/models/cloudinary_response.dart';
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

  CloudinaryService _cloudinaryService;

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

      // storing video
      CloudinaryResponse response = await this._cloudinaryService.uploadVideo(_videoDataService.videoPath);

      // selecting random element from sample video list
      final _random = new Random();
      var thumbnailImage = SampleImage.images[_random.nextInt(SampleImage.images.length)];

      Class currentClass = Class(
          moduleId: this._moduleId,
          title: _titleController.text,
          description: _descriptionCotroller.text,
          videoUrl: response.url,
          thumbnailImage: thumbnailImage);
      Class createdClass = await _classesService.createClass(currentClass);

      print('after');
      print(createdClass.thumbnailImage);
      setBusy(false);
      _navigationService.back(result: true);
    }
  }

  onModelReady(int moduleId) {
    this._moduleId = moduleId;
    // TODO: hide api data
    this._cloudinaryService = CloudinaryService('627365425715361', 'NyCAm_eu42QsVET4ITzO_vVH-cc', 'dzvvvii9u');
  }
}
