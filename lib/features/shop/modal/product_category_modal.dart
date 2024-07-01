import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModal {
  final String productId;
  final String categoryId;

  ProductCategoryModal({
    required this.productId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'categoryId': categoryId,
    };
  }

  factory ProductCategoryModal.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModal(
        productId: data['productId'] as String,
        categoryId: data['categoryId'] as String);
  }
}
