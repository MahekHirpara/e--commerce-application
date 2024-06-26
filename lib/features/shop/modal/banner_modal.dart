import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModal {

  final bool active;
  final String image;
  final  String targetSearch;

  BannerModal({
    required this.active,
    required this.image,
    this.targetSearch = '/search',
});



  ///convert modal to Json structure
  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'imageUrl': image,
      'targetSearch': targetSearch,

    };
  }

  ///Map Json oriented document snapshot from Firebase to UserModal
  factory BannerModal.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
      final data = document.data()!;
      return BannerModal(
        active: data['active'] ?? false,
        image: data['imageUrl'] ?? '',
        targetSearch: data['targetSearch'] ?? '',
      );

  }
}