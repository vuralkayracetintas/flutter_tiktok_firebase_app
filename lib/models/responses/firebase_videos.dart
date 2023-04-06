// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FirebaseVideos {
  String title;
  String desc;
  String videoUrl;
  int order;
  FirebaseVideos({
    required this.title,
    required this.desc,
    required this.videoUrl,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
      'videoUrl': videoUrl,
      'order': order,
    };
  }

  factory FirebaseVideos.fromJson(Map<String, dynamic> map) {
    return FirebaseVideos(
      title: map['title'] as String,
      desc: map['desc'] as String,
      videoUrl: map['videoUrl'] as String,
      order: map['order'] as int,
    );
  }
}
