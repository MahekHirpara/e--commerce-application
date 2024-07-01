import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/banner/banner_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';
import '../../../features/shop/modal/brand_modal.dart';

class BrandRepo extends GetxController{
  static BannerRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  
  //get all brand
 Future<List<BrandModal>> getAllBrand() async{
  try{
    final snapshot = await _db.collection('Brand').get();
    final result = snapshot.docs.map((e) => BrandModal.fromSnapshot(e)).toList();
    return result;
  }on FirebaseAuthException catch (e) {
    throw EFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw EFirebaseException(e.code).message;
  } on FormatException  {
    throw const EFormatException();
  } on PlatformException catch (e) {
    throw EPlatformException(e.code).message;
  }catch (e){
    throw 'Something went wrong,please try again';
  }
}


//Get Brands for category
  Future<List<BrandModal>> getBrandForCategory(String categoryId) async{
    try{
     QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId',isEqualTo: categoryId).get();
     
     //Extract brandId from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      
      final brandsQuery = await _db.collection('Brand').where(FieldPath.documentId,whereIn: brandIds).limit(2).get();

      List<BrandModal> brands = brandsQuery.docs.map((doc) => BrandModal.fromSnapshot(doc)).toList();
      return brands;
    }on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException  {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong,please try again';
    }
  }
}