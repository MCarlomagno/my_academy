import 'dart:async';
import 'dart:io';

import 'package:my_academy/app/locator.dart';
import 'package:my_academy/services/ui_services/video_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerViewModel extends BaseViewModel {

  /// service injection
  VideoDataService _videoDataService = locator<VideoDataService>();

  // Video player controller
  VideoPlayerController _controller;
  VideoPlayerController get controller => this._controller;

  Future<void> _initializeVideoPlayerFuture;
  Future<void> get initializeVideoPlayerFuture => this._initializeVideoPlayerFuture;

  // stream that listen the controller.position value
  Stream<Duration> _streamToProgress;
  StreamSubscription _streamSubscriptionToProgress;

  // video progress
  int _videoPositionInMiliseconds = 0;
  int get videoPositionInMiliseconds => this._videoPositionInMiliseconds;

  // shows play/pause button and video progress
  bool _showControls = true;
  bool get showControls => this._showControls;

  // timer for hide controls
  Timer _timer;

  // if the user pressed mute, this variable record the last volume used
  double _lastVolume = 1.0;

  onModelReady(File videoFile) async {
    setBusy(true);
    _controller = VideoPlayerController.file(videoFile);

    // Initialize the controller and store the Future for later use.
    await _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);

    setBusy(false);
  }

  String printDuration(Duration duration) {
    if (duration != null) {
      String twoDigits(int n) {
        if (n >= 10) return "$n";
        return "0$n";
      }

      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "00:00";
    }
  }

  startStreaming() {
    if (!isBusy) {
      _streamToProgress = this._controller.position.asStream();
      _streamSubscriptionToProgress = _streamToProgress.listen((event) {
        if (_controller.value.duration.inMilliseconds.toDouble() > event.inMilliseconds.toDouble()) {
          _videoPositionInMiliseconds = event.inMilliseconds;
          notifyListeners();
        }
      });
    }
  }

  onTapScreen() {
    if (_timer != null) {
      this._timer.cancel();
    }
    if (_showControls) {
      this._timer = Timer(const Duration(seconds: 3), () {
        this._showControls = false;
        notifyListeners();
      });
    } else {
      this._showControls = true;
      notifyListeners();
      this._timer = Timer(const Duration(seconds: 3), () {
        this._showControls = false;
        notifyListeners();
      });
    }
  }

  void onVolumePressed() {
    if (_controller.value.volume != 0) {
      _controller.setVolume(0.0);
    } else {
      _controller.setVolume(_lastVolume);
    }
  }

  void onVolumeChanged(val) {
    _lastVolume = val;
    _controller.setVolume(val);
    onTapScreen();
  }

  void onVideoPositionChanged(value) {
    onTapScreen();
    var duration = Duration(milliseconds: value.floor());
    _controller.seekTo(duration);
    if (_controller.value.duration.inMilliseconds.toDouble() > value.floor().toDouble()) {
      _videoPositionInMiliseconds = value.floor();
    }
    notifyListeners();
  }

  void onPlayButtonPressed() {
    onTapScreen();
    // If the video is playing, pause it.
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      // If the video is paused, play it.
      _controller.play();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    this._timer.cancel();
    this._streamSubscriptionToProgress.cancel();
    this._controller.dispose();
    super.dispose();
  }

  onCloseButtonPressed() {
    _videoDataService.setVideoPlayerOpened(false);
  }
}
