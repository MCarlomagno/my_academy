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
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  final picker = ImagePicker();
  File videoFile;
  var showControls = true;
  Timer timer;
  int videoPositionInMiliseconds = 0;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        ), // This trailing comma makes auto-formatting nicer for build methods.
                      ),
                      Spacer(),
                      Slider(
                        activeColor: Theme.of(context).accentColor,
                        value: videoPositionInMiliseconds.toDouble(),
                        onChanged: (value) => {},
                        min: 0.0,
                        max: _controller.value.duration.inMilliseconds.toDouble(),
                        label: 'Video',
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
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
        _controller.setLooping(true);
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
          // Here you can write your code for open new view
        });
      });
    } else {
      _controller.position.then((value) {
        setState(() {
          videoPositionInMiliseconds = value.inMilliseconds;
        });
      });
      setState(() {
        showControls = true;
        // Here you can write your code for open new view
      });
      timer = Timer(const Duration(seconds: 3), () {
        setState(() {
          showControls = false;
          // Here you can write your code for open new view
        });
      });
    }
  }
}
