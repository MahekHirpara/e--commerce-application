import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/shop/modal/category_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';
import '../../services/firebase_storage_service.dart';

class CategoriesRepo extends GetxController {
  final _db = FirebaseFirestore.instance;

  ///Get All categories
Future<List<CategoriesModal>> getAllCategories() async{
  try{
    final snapshot = await _db.collection('Categories').get();
    final list =snapshot.docs.map((document) => CategoriesModal.fromSnapshot(document)).toList();
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
  ///Get sub categories

  ///Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoriesModal> categories) async{
    try{
final storage = Get.put(EFirebaseStorageService());

for(var category in categories){
  final file = await storage.getImageDataFromAssets(category.image);

  final url = await storage.uploadImageData('Categories',file,category.name);

  category.image = url;
  await _db.collection('Categories').doc(category.id).set(category.toJson());
}
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
