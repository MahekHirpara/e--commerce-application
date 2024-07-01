import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Featured Products
  Future<List<ProductModal>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModal.fromSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }

  //All Product
  Future<List<ProductModal>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModal.fromSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }

  // GEtProduct base on brand
  Future<List<ProductModal>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModal> productList = querySnapshot.docs
          .map((doc) => ProductModal.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }

  //Product for brand
  Future<List<ProductModal>> getProductForBrand(
      {required String id, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: id)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: id)
              .limit(limit)
              .get();
      final productList = querySnapshot.docs
          .map((doc) => ProductModal.fromSnapshot(doc))
          .toList();
      return productList;
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }
//Product for category
  Future<List<ProductModal>> getProductForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      final productIds = querySnapshot.docs.map((doc) => doc['productId'] as String).toList();
      final productQuery = await _db.collection('Products').where(FieldPath.documentId,whereIn: productIds).get();
      List<ProductModal> products = productQuery.docs.map((doc) => ProductModal.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }

  //product for wishlist

Future<List<ProductModal>> getFavouriteProduct(List<String> productId) async{
  try {
    final snapshot = await _db.collection('Products').where(FieldPath.documentId,whereIn: productId).get();
    return snapshot.docs.map((querySnapshot) => ProductModal.fromSnapshot(querySnapshot)).toList();
  } on FirebaseAuthException catch (e) {
    throw EFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw EFirebaseException(e.code).message;
  } on FormatException {
    throw const EFormatException();
  } on PlatformException catch (e) {
    throw EPlatformException(e.code).message;
  } catch (e) {
    print('unknone errer ${e.toString()}');
    throw 'Something went wrong,please try again';
  }
}
}
