import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok_app/constants/api_constants.dart';
import 'package:tiktok_app/models/responses/firebase_videos.dart';

class FirebaseService {
  final CollectionReference _videosColectionReferance =
      FirebaseFirestore.instance.collection(ApiConstants.FIRESTORE_VIDEOS_PATH);
  init() {
    signInAnonumously();
  }

  signInAnonumously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<List<FirebaseVideos>> getVideos() async {
    List<FirebaseVideos> firebaseVideos = [];
    await _videosColectionReferance.orderBy('order').get().then((value) {
      value.docs.forEach((element) {
        var item =
            FirebaseVideos.fromJson(element.data() as Map<String, dynamic>);
        firebaseVideos.add(item);
      });
    });
    return firebaseVideos;
  }
}
