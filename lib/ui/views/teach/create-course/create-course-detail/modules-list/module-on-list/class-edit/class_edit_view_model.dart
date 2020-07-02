import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/class_model.dart';
import 'package:my_academy/services/api/classes_service.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassEditViewModel extends BaseViewModel {
  // We will save sample mp4 videos untill we already implement a storage service to host the videos
  var sampleVideos = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  ];


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
      var videoUrl = sampleVideos[_random.nextInt(sampleVideos.length)];
      
      Class currentClass = Class(
          moduleId: this._moduleId,
          title: _titleController.text,
          description: _descriptionCotroller.text,
          videoUrl: videoUrl);
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
