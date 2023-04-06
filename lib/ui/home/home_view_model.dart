import 'package:tiktok_app/app/app_base_view_model.dart';
import 'package:tiktok_app/models/responses/firebase_videos.dart';

class HomeViewModel extends AppBaseViewModel {
  List<FirebaseVideos>? videos;
  init() {
    firebaseService.getVideos().then((value) {
      videos = value;
      notifyListeners();
    });
  }
}
