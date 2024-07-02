
import 'package:e_commerce_app/common/widget/loaders/processing_loader.dart';
import 'package:e_commerce_app/features/authentication/screens/passwoed_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication_repo.dart';
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
      ProcessingLoader.openLoadingDialog('We are processing your information');
      // EFullScreenLoader.openLoadingDialog(
      //     'We are processing your information', EImages.onBoardingImage1);

      //connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ProcessingLoader.stopLoading();
        return;
      }

      ///Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        ProcessingLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPasswordEmail(email.text.trim());

      ProcessingLoader.stopLoading();

      Get.to(
        () => ResetPassword(
          email: email.text.trim(),
        ),
      );
    } catch (e) {
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      ProcessingLoader.openLoadingDialog('We are processing your information');
      // EFullScreenLoader.openLoadingDialog(
      //     'We are processing your information', EImages.onBoardingImage1);
      //connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ProcessingLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPasswordEmail(email);

      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(
          title: 'Email sent',
          message: 'Email link sent to reset your Password');
    } catch (e) {
      ProcessingLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
