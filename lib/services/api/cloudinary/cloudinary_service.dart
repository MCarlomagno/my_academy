

import 'clients/video_client.dart';
import 'models/cloudinary_response.dart';

class CloudinaryService {
  String _apiKey;
  String _apiSecret;
  String _cloudName;
  //ImageClient _imageClient;
  VideoClient _videoClient;

  CloudinaryService(String apiKey, String apiSecret, String cloudName) {
    this._apiKey = apiKey;
    this._apiSecret = apiSecret;
    this._cloudName = cloudName;
    //_imageClient = ImageClient(_apiKey, _apiSecret, _cloudName);
    _videoClient = VideoClient(_apiKey, _apiSecret, _cloudName);
  }

  Future<CloudinaryResponse> uploadVideo(String videoPath,
      {String filename, String folder}) async {
    return _videoClient.uploadVideo(videoPath,
        videoFileName: filename, folder: folder);
  }
}
