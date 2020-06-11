import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  // Video player controller
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  //To pick the video from gallery
  final picker = ImagePicker();
  File videoFile;

  // shows play/pause button and video progress
  var showControls = true;
  // timer for hide controls
  Timer timer;

  // video progress
  int videoPositionInMiliseconds = 0;

  // stream that listen the controller.position value
  Stream<Duration> streamToProgress;
  StreamSubscription streamSubscriptionToProgress;

  // if the user pressed mute, this variable record the last volume used
  double lastVolume = 1.0;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //controller progress stream
    if (this._controller?.position != null) {
      streamToProgress = this._controller.position.asStream();
      startStreaming();
    }

    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Center(
              child: RaisedButton(
                child: Text("Agregar video"),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  getVideo();
                },
              ),
            ),
          ),
          Visibility(
            visible: _controller != null,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return GestureDetector(
                    onTap: () {
                      onTapScreen();
                    },
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Container(
                    color: Colors.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          _controller == null
              ? Container()
              : Visibility(
                  visible: showControls,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(_controller.value.volume == 0.0 ? Icons.volume_off : Icons.volume_up),
                              onPressed: () {
                                if (_controller.value.volume != 0) {
                                  setState(() {
                                    _controller.setVolume(0.0);
                                  });
                                } else {
                                  _controller.setVolume(lastVolume);
                                }
                              },
                            ),
                            Slider(
                              inactiveColor: Colors.grey[400],
                              activeColor: Theme.of(context).accentColor,
                              onChanged: (val) {
                                lastVolume = val;
                                onTapScreen();
                                setState(() {
                                  _controller.setVolume(val);
                                });
                              },
                              value: _controller.value.volume,
                              min: 0.0,
                              max: 1.0,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        iconSize: 50,
                        onPressed: () {
                          // Wrap the play or pause in a call to `setState`. This ensures the
                          // correct icon is shown.
                          onTapScreen();
                          setState(() {
                            // If the video is playing, pause it.
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              // If the video is paused, play it.
                              _controller.play();
                            }
                          });
                        },
                        // Display the correct icon depending on the state of the player.
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ), // This trailing comma makes auto-formatting nicer for build methods.
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(_printDuration(Duration(milliseconds: videoPositionInMiliseconds))),
                            Text(_printDuration(_controller.value.duration)),
                          ],
                        ),
                      ),
                      Slider(
                        inactiveColor: Colors.grey[400],
                        activeColor: Theme.of(context).accentColor,
                        value: videoPositionInMiliseconds.toDouble(),
                        onChanged: (value) {
                          onTapScreen();
                          var duration = Duration(milliseconds: value.floor());
                          _controller.seekTo(duration);
                          setState(() {
                            if (_controller.value.duration.inMilliseconds.toDouble() > value.floor().toDouble()) {
                              videoPositionInMiliseconds = value.floor();
                            }
                          });
                        },
                        min: 0.0,
                        max: _controller.value.duration != null
                            ? _controller.value.duration.inMilliseconds
                                .toDouble() // added 100 milisec to maintain the max value always upper than actual value
                            : 0,
                        label: 'Video',
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    timer.cancel();
    streamSubscriptionToProgress.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    if (duration != null) {
      String twoDigits(int n) {
        if (n >= 10) return "$n";
        return "0$n";
      }

      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "$twoDigitMinutes:$twoDigitSeconds";
    }else {
      return "00:00";
    }
  }

  startStreaming() {
    streamSubscriptionToProgress = streamToProgress.listen((event) {
      setState(() {
        if (_controller.value.duration.inMilliseconds.toDouble() > event.inMilliseconds.toDouble()) {
          videoPositionInMiliseconds = event.inMilliseconds;
        }
      });
    });
  }

  Future getVideo() async {
    Future<PickedFile> _videoFile = picker.getVideo(source: ImageSource.gallery);
    _videoFile.then((file) async {
      setState(() {
        videoFile = File(file.path);
        _controller = VideoPlayerController.file(videoFile);

        // Initialize the controller and store the Future for later use.
        _initializeVideoPlayerFuture = _controller.initialize();

        // Use the controller to loop the video.
        _controller.setLooping(false);
      });
    });
  }

  onTapScreen() {
    if (timer != null) {
      timer.cancel();
    }
    if (showControls) {
      timer = Timer(const Duration(seconds: 3), () {
        setState(() {
          showControls = false;
        });
      });
    } else {
      setState(() {
        showControls = true;
      });
      timer = Timer(const Duration(seconds: 3), () {
        setState(() {
          showControls = false;
        });
      });
    }
  }
}
