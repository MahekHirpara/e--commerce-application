
import 'package:e_commerce_app/features/shop/screen/personalition/controller/user_controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widget/loaders/processing_loader.dart';
import '../../../../data/repositories/authentication_repo.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';
import '../network_manager.dart';

class LoginController extends GetxController{

  static LoginController get instance => Get.find();

  final rememberMe= false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void> emailAndPasswordSingIn() async{
    try{
      ///start Loading
      ProcessingLoader.openLoadingDialog('We are processing your information');
      // EFullScreenLoader.openLoadingDialog(
      //     'We are processing your information', EImages.onBoardingImage1);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ProcessingLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!loginFormKey.currentState!.validate()) {
        ProcessingLoader.stopLoading();
        return;
      }

      ///Remember me Check
      if (!rememberMe.value) {
       localStorage.write('Remember_me_Email', email.text.trim());
       localStorage.write('Remember_me_Password',password.text.trim());
        return;
      }


      //Login user using Email&Password
       await AuthenticationRepo.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ProcessingLoader.stopLoading();

      AuthenticationRepo.instance.screenRedirect();
    }catch(e){
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap login!',message: e.toString());
    }
  }

  //Google sing in
  Future<void> googleSignIn() async{
    try{
      ///start Loading
      ProcessingLoader.openLoadingDialog('We are processing your information');
      // EFullScreenLoader.openLoadingDialog(
      //     'We are processing your information', EImages.onBoardingImage1);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ProcessingLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials = await AuthenticationRepo.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      ProcessingLoader.stopLoading();

      AuthenticationRepo.instance.screenRedirect();

    }catch(e){
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}