import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';

class ProductRepo extends GetxController{
  
  static ProductRepo get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;
  
  
  //Featured Products

  Future<List<ProductModal>> getFeaturedProducts() async{
    try{
     final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
     return snapshot.docs.map((e) => ProductModal.fromSnapshot(e)).toList();

    }on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException  {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    }catch (e){
      print('unknone errer ${e.toString()}');
      throw 'Something went wrong,please try again';
    }
  }
}