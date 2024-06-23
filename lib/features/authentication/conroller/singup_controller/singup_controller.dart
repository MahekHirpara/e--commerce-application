import 'package:e_commerce_app/data/repositories.authentication/authentication_repo.dart';
import 'package:e_commerce_app/data/repositories.authentication/user_repo/user_repository.dart';
import 'package:e_commerce_app/features/authentication/modals/user_modal/user_modal.dart';
import 'package:e_commerce_app/features/authentication/screens/singup/verify_email.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../network_manager.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

  Future<void> singUp() async {
    try {
      ///start Loading
      EFullScreenLoader.openLoadingDialog(
          'We are processing your information', EImages.onBoardingImage1);

      ///Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!singupFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        ELoaders.warnigSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy &Terms of use');
        return;
      }

      ///Register user in Firebase Authentication & Save data in the Firebase
      final userCredential = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///Save Authenticated userData in the Firebase SireStore
      final newUser = UserModal(
        email: email.text.trim(),
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepo = Get.put(UserRepo());
      userRepo.saveUserData(newUser);

      EFullScreenLoader.stopLoading();

      ///SuccessMessage
      ELoaders.successSnackBar(
          title: 'Congratulation',
          message: 'Your account has been created! Verify email to continue');

      ///Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
