import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';
import '../../../features/authentication/modals/user_modal/user_modal.dart';
import '../authentication_repo.dart';

class UserRepo extends GetxController{
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Save user data to FireStore
  Future<void> saveUserData(UserModal user) async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
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

  ///Fetch user Details
  Future<UserModal> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepo.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModal.fromSnapshot(documentSnapshot);
      }else{
        return UserModal.empty();
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

  //update User Details
  Future<void> updateUserDetails(UserModal updateUser) async{
    try{
      await _db.collection('User').doc(updateUser.id).update(updateUser.toJson());
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

  //update any single field in specific Users Collection
  Future<void> updateSingleField(Map<String,dynamic> json) async{
    try{
      await _db.collection('Users').doc(AuthenticationRepo.instance.authUser?.uid).update(json);
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

  //Remove User data
  Future<void> deleteUserData(String userId) async{
    try{
      await _db.collection('Users').doc(userId).delete();
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

  ///Upload Image
  Future<String> uploadImage(String path,XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url =await ref.getDownloadURL();
      return url;
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