import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication_repo.dart';
import 'package:get/get.dart';

import '../../../features/shop/modal/order_modal.dart';

class OrderRepo extends GetxController{
  static OrderRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  Future<List<OrderModal>> fetchUserOrder()async{
    try{
      final userId = AuthenticationRepo.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable to find user information try again in few minutes';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) =>OrderModal.fromSnapshot(documentSnapshot)).toList();
    }catch(e){
      throw 'Something went wrong while fetching Order Information.try again';
    }
  }

  Future<void> saveOrder(OrderModal order,String userId) async{
    try{
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }catch(e){
      throw 'Something went wrong while saving Order Information .try again';
    }
  }
}