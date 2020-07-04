import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/samples/sample_images.dart';
import 'package:my_academy/samples/sample_videos.dart';
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

      // selecting random element from sample video list
      final _random = new Random();
      var videoUrl = SampleVideo.sampleVideos[_random.nextInt(SampleVideo.sampleVideos.length)];
      var thumbnailImage = SampleImage.images[_random.nextInt(SampleImage.images.length)];

      print('before');
      print(thumbnailImage);
      
      Class currentClass = Class(
          moduleId: this._moduleId,
          title: _titleController.text,
          description: _descriptionCotroller.text,
          videoUrl: videoUrl,
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
  }
}
