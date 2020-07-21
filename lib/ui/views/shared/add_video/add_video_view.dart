import 'package:flutter/material.dart';
import 'package:kidd_video_player/kidd_video_player.dart';
import 'package:stacked/stacked.dart';
import 'add_video_view_model.dart';

class AddVideoView extends StatelessWidget {
  const AddVideoView({Key key, this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddVideoViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(url),
      builder: (context, model, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Padding(
                        child: Icon(
                          Icons.file_upload,
                          size: 50,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20.0),
                      ),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.transparent,
                      onPressed: () {
                        model.getVideoFromGallery();
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      child: Padding(
                        child: Icon(
                          Icons.videocam,
                          size: 50,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(20.0),
                      ),
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Colors.transparent,
                      onPressed: () {
                        model.getVideoFromCamera();
                      },
                    ),
                  ],
                ),
              ),
              model.videoFile != null && model.videoLoaded && model.videoPlayerOpened
                  ? KiddVideoPlayer(
                      videoFile: model.videoFile,
                      fromUrl: false,
                    )
                  : Container(),
              Visibility(
                visible: url != null,
                child: KiddVideoPlayer(
                  fromUrl: true,
                  videoUrl: url,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => AddVideoViewModel(),
    );
  }
}
