import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/shared/video_player/video_player_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatelessWidget {
  const VideoPlayerView({Key key, @required this.file}) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoPlayerViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(this.file),
      builder: (context, model, child) {
        model.startStreaming();

        return Container(
          color: Colors.black,
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.height * 0.8
              : MediaQuery.of(context).size.height * 0.5,
          // Use a FutureBuilder to display a loading spinner while waiting for the
          // VideoPlayerController to finish initializing.
          child: Stack(
            children: <Widget>[
              Visibility(
                visible: !model.isBusy,
                child: GestureDetector(
                  onTap: () {
                    model.onTapScreen();
                  },
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: model.controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(model.controller),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: model.isBusy,
                child: Center(
                  child: CircularProgressIndicator(),
                )
              ),
              Visibility(
                visible: !model.isBusy && model.showControls,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              model.controller.value.volume == 0.0 ? Icons.volume_off : Icons.volume_up,
                              size: 20,
                            ),
                            onPressed: () {
                              model.onVolumePressed();
                            },
                          ),
                          Slider(
                            inactiveColor: Colors.grey[400],
                            activeColor: Theme.of(context).accentColor,
                            onChanged: (val) {
                              model.onVolumeChanged(val);
                            },
                            value: model.controller.value.volume,
                            min: 0.0,
                            max: 1.0,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => model.onCloseButtonPressed(),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(model.printDuration(Duration(milliseconds: model.videoPositionInMiliseconds))),
                          Text(model.printDuration(model.controller.value.duration)),
                        ],
                      ),
                    ),
                    Slider(
                      inactiveColor: Colors.grey[400],
                      activeColor: Theme.of(context).accentColor,
                      value: model.videoPositionInMiliseconds.toDouble(),
                      onChanged: (value) {
                        model.onVideoPositionChanged(value);
                      },
                      min: 0.0,
                      max: model.controller.value.duration != null
                          ? model.controller.value.duration.inMilliseconds
                              .toDouble() // added 100 milisec to maintain the max value always upper than actual value
                          : 0,
                      label: 'Video',
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: !model.isBusy && model.showControls,
                  child: Center(
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        model.onPlayButtonPressed();
                      },
                      // Display the correct icon depending on the state of the player.
                      icon: Icon(
                        model.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ), // This trailing comma makes auto-formatting nicer for build methods.
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      viewModelBuilder: () => VideoPlayerViewModel(),
      disposeViewModel: true,
    );
  }
}
