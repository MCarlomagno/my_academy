import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class VideoDataService with ReactiveServiceMixin {
  String _videoPath;
  RxValue<bool> _videoPlayerOpened = RxValue<bool>(initial: true);

  VideoDataService() {
    listenToReactiveValues([_videoPlayerOpened]);
  }

  bool get videoLoaded => this._videoPath != null && this._videoPath.isNotEmpty;
  bool get videoPlayerOpened => this._videoPlayerOpened.value;

  setVideoPlayerOpened(bool opened) {
    this._videoPlayerOpened.value = opened;
  }

  setVideoPath(String videoPath) {
    this._videoPath = videoPath;
  }

  String get videoPath => this._videoPath;
  
}

