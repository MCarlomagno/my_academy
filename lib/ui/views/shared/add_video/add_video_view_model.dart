import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddVideoViewModel extends ReactiveViewModel {

  // service injection
  NavigationService _navigationService = locator<NavigationService>();
  VideoDataService _videoDataService = locator<VideoDataService>();

  bool _videoLoaded = false;
  bool get videoLoaded => this._videoLoaded;

  //To pick the video from gallery
  final _picker = ImagePicker();

  File get videoFile => this._videoFile;
  File _videoFile;

  bool get videoPlayerOpened => _videoDataService.videoPlayerOpened;

  Future getVideoFromGallery() async {
    PickedFile pickedFile = await _picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _videoFile = File(pickedFile.path);
      _videoDataService.setVideoPlayerOpened(true);
      this._videoLoaded = true;
      notifyListeners();
    }
  }

  void getVideoFromCamera() async {
    bool result = await _navigationService.navigateTo(Routes.videoCameraView);
    print('Resultado de uso de camara: ' + result.toString());
    if(result != null && result && _videoDataService.videoLoaded) {
      _videoFile = File(_videoDataService.videoPath);
      _videoDataService.setVideoPlayerOpened(true);
      this._videoLoaded = true;
      notifyListeners();
      // access to some service to pick up the video path and show it on video player
    }
  }

  /// To make the service reactive (listen variable changes)
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_videoDataService];
}
