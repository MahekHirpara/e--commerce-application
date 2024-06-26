import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/modal/banner_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';

class BannerRepo extends GetxController{
  static BannerRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModal>> fetchBanner() async{
    try{
      final snapshot = await _db.collection('Banners').where('active',isEqualTo: true).get();
      final list =snapshot.docs.map((document) => BannerModal.fromSnapshot(document)).toList();
      return list;
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