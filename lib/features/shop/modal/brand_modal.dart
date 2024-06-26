import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModal {
  String id;
  String name;
  String image;
  bool? isIsFeatured;
  int? productsCount;

  BrandModal({
    required this.id,
    required this.image,
    required this.name,
    this.isIsFeatured,
    this.productsCount,

});

  static BrandModal empty() => BrandModal(id: '', image: '', name: '');

  toJson(){
    return{
      'Id' : id,
      'Image' :name,
      'Name': name,
      'ProductCount' : productsCount,
      'IsFeatured' : isIsFeatured,
    };
  }

  factory BrandModal.fromJson(Map<String, dynamic> document){
    final data = document;
    return BrandModal(
        id: data['Id'] ?? '',
        image:  data['Image'] ?? '',
        name:  data['Name'] ?? '',
    );

  }

  factory BrandModal.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return BrandModal(
        id: document.id,
        image:  data['Image'] ?? '',
        name:  data['Name'] ?? '',
      );
    }else{
      return BrandModal.empty();
    }


  }

}