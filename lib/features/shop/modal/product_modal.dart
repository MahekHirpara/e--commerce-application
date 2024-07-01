import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/modal/product_attribute_modal.dart';
import 'package:e_commerce_app/features/shop/modal/product_variation_modal.dart';

import 'brand_modal.dart';

class ProductModal{
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModal? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModal>? productAttributes;
  List<ProductVariationModal>? productVariations;

  ProductModal({
    required this.id,
     required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.productType,
    this.salePrice=0.0,
    this.sku,
    this.date,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    this.productAttributes,
    this.productVariations,
});

  static ProductModal empty(){
    return ProductModal(
        id: '',
        stock: 0,
        price: 0,
        title: '',
        thumbnail: '',
        productType: ''
    );
  }
  toJson(){
    return{
      'SKU' :sku,
      'Title' : title,
      'Stock' : stock,
      'Price':price,
      'Images' :images ?? [],
      'Thumbnail' : thumbnail,
      'SalePrice' : salePrice,
      'IsFeatured' : isFeatured,
      'CategoryId' :categoryId,
      'Brand' : brand!.toJson(),
      'Description' : description,
      'ProductType' :productType,
      'ProductAttributs' :productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
       'productVariations ': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    } ;
  }

  factory ProductModal.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return ProductModal(
        id: document.id,
        stock: data['Stock'] ?? 0,
        price:  double.tryParse(data['Price']?.toString() ?? '0.0') ?? 0.0,
        title: data['Title'] ?? '',
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        sku:data['SKU'] ?? '' ,
        salePrice: double.tryParse(data['SalePrice']?.toString() ?? '0.0') ?? 0.0,
      brand: data['Brand'] != null ?BrandModal.fromJson(data['Brand']) : BrandModal.empty(),
      categoryId:data['CategoryId'] ?? '' ,
      description: data['Description'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['IsFeatured'] ?? false,
      productAttributes: data['ProductAttributs'] != null? (data['ProductAttributs'] as List<dynamic>).map((e) => ProductAttributeModal.fromJson(e)).toList() : [],
      productVariations: data['productVariations'] != null ?(data['productVariations'] as List<dynamic>).map((e) => ProductVariationModal.fromJson(e)).toList() : [],
    );
  }


  factory ProductModal.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document){
    final data = document.data() as Map<String,dynamic>;
    return ProductModal(
      id: document.id,
      stock: data['Stock'] ?? 0,
      price:  double.parse((data['Price'] ?? 0.0).toString()),
      title: data['Title'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
      sku:data['SKU'] ?? '' ,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      brand:data['Brand'] != null ?BrandModal.fromJson(data['Brand']) : BrandModal.empty(),
      categoryId:data['CategoryId'] ?? '' ,
      description: data['Description'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['IsFeatured'] ?? false,
      productAttributes: (data['ProductAttributs'] as List<dynamic>).map((e) => ProductAttributeModal.fromJson(e)).toList(),
       productVariations: (data['productVariations'] as List<dynamic>).map((e) => ProductVariationModal.fromJson(e)).toList(),
    );
  }

}