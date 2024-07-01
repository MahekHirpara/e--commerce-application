import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModal {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  String? thumbnail;

  CategoriesModal({required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
    this.thumbnail = '',
  });

  ///Empty Helper function
  static CategoriesModal empty() =>
      CategoriesModal(id: '', name: '', image: '', isFeatured: false);

  ///convert modal to Json structure
  Map<String, dynamic> toJson() {
    return {
      'ParentId': parentId,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'Thumbnail' : thumbnail,
    };
  }

  ///Map Json oriented document snapshot from Firebase to UserModal
  factory CategoriesModal.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data()!;
      return CategoriesModal(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
        thumbnail:  data['Thumbnail'] ?? '',
      );
    } else {
      return CategoriesModal.empty();
    }
  }
}
