import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum CameraType { Front, Back }

class VideoCameraViewModel extends BaseViewModel {
  /// service injection
  NavigationService _navigationService = locator<NavigationService>();
  VideoDataService _videoDataService = locator<VideoDataService>();

  /// video camera controller
  CameraController _controller;
  CameraController get controller => this._controller;

  bool _videoFinished = false;
  bool get videoFinished => this._videoFinished;

  bool _recording = false;
  bool get recording => this._recording;

  /// the path directory of the created video
  String videoPath;

  /// Device cameras
  List<CameraDescription> _cameras;

  // timer for time recorded
  Timer _timer;

  // seconds recorded
  int _secondsRecorded = 0;

  onModelReady() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    this.startCamera();
  }

  void startCamera() async {
    setBusy(true);
    this._cameras = await availableCameras();
    this._controller = CameraController(this._cameras.first, ResolutionPreset.veryHigh, enableAudio: true);
    await controller.initialize();
    setBusy(false);
  }

  @override
  void dispose() {
    controller?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  playButtonPressed() async {
    if (this._recording) {
      this._recording = false;
      notifyListeners();
      await stopVideoRecording();
    } else {
      this._recording = true;
      notifyListeners();
      await startVideoRecording();
    }
  }

  startVideoRecording() async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/$currentTime.mp4';

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {});

    print('FILE PATH');
    print(filePath);

    try {
      await _controller.startVideoRecording(filePath);
      startTimerRecording();
      videoPath = filePath;
    } on CameraException catch (e) {
      print('ERROR INICIANDO EL VIDEO: ' + e.toString());
      return null;
    }

    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!_controller.value.isRecordingVideo) {
      return null;
    }
    _videoDataService.setVideoPath(this.videoPath);
    stopTimerRecording();
    try {
      await _controller.stopVideoRecording();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      _navigationService.back(result: true);
    } on CameraException catch (e) {
      print('ERROR FINALIZANDO EL VIDEO: ' + e.toString());
      return null;
    }
  }

  ///
  /// TODO implement documentation
  /// 
  String printDuration() {
    Duration duration = Duration(seconds: _secondsRecorded);
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  onBackButtonPressed() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _navigationService.back(result: false);
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (this._controller != null) {
      await this._controller.dispose();
    }
    this._controller = CameraController(cameraDescription, ResolutionPreset.veryHigh, enableAudio: true);

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e.toString());
    }
  }

  void startTimerRecording() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      this._secondsRecorded++;
      notifyListeners();
    });
  }

  void stopTimerRecording() {
    _timer.cancel();
  }
}
