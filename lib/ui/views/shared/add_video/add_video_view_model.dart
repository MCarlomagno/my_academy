import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class AddVideoViewModel extends BaseViewModel {
  bool _videoLoaded = false;
  bool get videoLoaded => this._videoLoaded;

  //To pick the video from gallery
  final _picker = ImagePicker();
  
  File get videoFile => this._videoFile;
  File _videoFile;

  Future getVideoFromGallery() async {
    PickedFile pickedFile = await _picker.getVideo(source: ImageSource.gallery);
    _videoFile = File(pickedFile.path);
    this._videoLoaded = true;
    notifyListeners();
  }

  void getVideoFromCamera() {
    throw UnimplementedError();
  }
}
