import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../exaptation/firebase_auth_exception.dart';
import '../../../exaptation/firebase_exception.dart';
import '../../../exaptation/formate_exception.dart';
import '../../../exaptation/plateform_exception.dart';
import '../../../features/shop/screen/personalition/modal/address_modal.dart';

class AddressRepo extends GetxController {
  static AddressRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModal>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information,try again';

      final result = await _db.collection('Users').doc(userId).collection('Address').get();
      return result.docs.map((e) => AddressModal.fromDocumentSnapshot(e)).toList();
    } on FirebaseAuthException catch (e) {
      throw EFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFirebaseException(e.code).message;
    } on FormatException {
      throw const EFormatException();
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong,please try again';
    }
  }

  Future<void> updateSelectedField(String addressId,bool selected) async{
    try{
      final userId = AuthenticationRepo.instance.authUser!.uid;
      await _db.collection('Users').doc(userId).collection('Address').doc(addressId).update({'SelectedAddress' : selected});
    }catch(e){
      throw '${e.toString()} Unable to update your address selection,Try again';
    }
  }
  
  Future<String> addAddress(AddressModal address) async{
    try{
      final userId = AuthenticationRepo.instance.authUser!.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Address').add(address.toJson());
      return currentAddress.id;

    }catch(e){
      throw '${e.toString()}Something went wrong while saving Address Information,Try again later';
    }
  }
}
