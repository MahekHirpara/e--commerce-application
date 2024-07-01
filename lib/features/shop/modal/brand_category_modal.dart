import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModal{
  final String brandId;
  final String categoryId;

  BrandCategoryModal( {
   required this.brandId,
    required this.categoryId,

});

  Map<String,dynamic> toJson(){
    return{
      'brandId' : brandId,
      'categoryId' : categoryId,
    };
  }

  factory BrandCategoryModal.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String,dynamic>;
    return BrandCategoryModal(brandId: data['brandId'] as String, categoryId: data['categoryId'] as String);
  }
}