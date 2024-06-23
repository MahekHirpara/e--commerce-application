import 'package:e_commerce_app/data/repositories.authentication/user_repo/user_repository.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/controller/user_controller/user_controller.dart';
import 'package:e_commerce_app/features/shop/screen/personalition/screens/profile/profile_sc.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constant/image_string.dart';
import '../../../../../../utils/popups/loader.dart';
import '../../../../../authentication/conroller/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();
  
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepo());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();
  
  @override
  void onInit(){
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName ;
  }
  
  Future<void> updateUserName() async{
    try{
      EFullScreenLoader.openLoadingDialog('We are updating your information', EImages.onBoardingImage1);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // ///form validation
      // if (!updateNameFormKey.currentState!.validate()) {
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      ///Update user's first & last Name
      Map<String,dynamic> name = {'FirstName' : firstName.text.trim(),'LastName':lastName.text.trim()};
      await userRepo.updateSingleField(name);

      userController.user.value.firstName =firstName.text.trim();
      userController.user.value.lastName =lastName.text.trim();

      EFullScreenLoader.stopLoading();

      ///SuccessMessage
      ELoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your name has been updated');
      Get.off(() => const ProfileScreen());
    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}