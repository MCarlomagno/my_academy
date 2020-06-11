import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/shared/video_player/video_player_view.dart';
import 'package:stacked/stacked.dart';
import 'add_video_view_model.dart';

class AddVideoView extends StatelessWidget {
  const AddVideoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddVideoViewModel>.reactive(
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
                      child: Text("Agregar video"),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        model.getVideoFromGallery();
                      },
                    ),
                    RaisedButton(
                      child: Text("Filmar"),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        model.getVideoFromCamera();
                      },
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: model.videoLoaded,
                child: VideoPlayerView(
                  file: model.videoFile,
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
