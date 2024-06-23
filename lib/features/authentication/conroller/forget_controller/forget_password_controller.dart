import 'package:e_commerce_app/data/repositories.authentication/authentication_repo.dart';
import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';
import '../network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResendEmail() async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'We are processing your information', EImages.onBoardingImage1);

      //connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPasswordEmail(email.text.trim());

      EFullScreenLoader.stopLoading();

      Get.to(
        () => ResetPassword(
          email: email.text.trim(),
        ),
      );
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      EFullScreenLoader.openLoadingDialog(
          'We are processing your information', EImages.onBoardingImage1);
      //connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPasswordEmail(email);

      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(
          title: 'Email sent',
          message: 'Email link sent to reset your Password');
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
