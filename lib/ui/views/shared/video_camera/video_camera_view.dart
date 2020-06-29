import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/shared/video_camera/video_camera_view_model.dart';
import 'package:stacked/stacked.dart';

class VideoCameraView extends StatelessWidget {
  const VideoCameraView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VideoCameraViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            child: SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  !model.isBusy && model.controller != null
                      ? RotatedBox(
                          quarterTurns: -1,
                          child: Transform.scale(
                            scale: 1 / model.controller.value.aspectRatio,
                            child: Center(
                              child: AspectRatio(
                                aspectRatio: model.controller.value.aspectRatio,
                                child: CameraPreview(model.controller),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => model.onBackButtonPressed(),
                          ),
                          Spacer(),
                          Text(model.printDuration()),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.settings),
                            onPressed: () => null,
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              autofocus: true,
                              iconSize: 70.0,
                              alignment: Alignment.bottomCenter,
                              icon: Icon(
                                model.recording ? Icons.stop : Icons.play_arrow,
                              ),
                              onPressed: () => model.playButtonPressed(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => VideoCameraViewModel(),
      disposeViewModel: true,
    );
  }
}
