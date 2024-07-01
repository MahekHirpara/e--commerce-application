import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModal {
  String id;
  String name;
  String image;
  bool? IsFeatured;
  int? productsCount;

  BrandModal({
    required this.id,
    required this.image,
    required this.name,
    this.IsFeatured,
    this.productsCount,

});

  static BrandModal empty() => BrandModal(id: '', image: '', name: '');

  toJson(){
    return{
      'Id' : id,
      'Image' :name,
      'Name': name,
      'ProductCount' : productsCount,
      'IsFeatured' : IsFeatured,
    };
  }

  factory BrandModal.fromJson(Map<String, dynamic> document){
    final data = document;
    return BrandModal(
        id: data['Id'] ?? '',
        image:  data['Image'] ?? '',
        name:  data['Name'] ?? '',
        productsCount : data['ProductCount'] ?? 0,
       IsFeatured:  data['IsFeatured'] ?? false,
    );

  }

  factory BrandModal.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return BrandModal(
        id: document.id,
        image:  data['Image'] ?? '',
        name:  data['Name'] ?? '',
        productsCount : data['ProductCount'] ?? 0,
        IsFeatured:  data['IsFeatured'] ?? false,
      );
    }else{
      return BrandModal.empty();
    }


  }

}