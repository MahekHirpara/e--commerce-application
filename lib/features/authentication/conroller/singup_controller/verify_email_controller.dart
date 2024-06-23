import 'dart:async';

import 'package:e_commerce_app/common/widget_login_sing_up/success.dart';
import 'package:e_commerce_app/data/repositories.authentication/authentication_repo.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/text.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerAutoRedirect();
    super.onInit();
  }

  void sendEmailVerification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerification();
      ELoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your index and verify your email');
    } catch (e) {
      ELoaders.errorSnackBar(title: 'Oh Shap!!', message: e.toString());
    }
  }

  void setTimerAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccessScreen(
              image: EImages.emailSuccess,
              title: EText.yourAccountCreatedTitle,
              subTitle: EText.yourAccountCreatedSubTitle,
              onpressed: () =>
                 AuthenticationRepo.instance.screenRedirect(),

            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: EImages.emailSuccess,
          title: EText.yourAccountCreatedTitle,
          subTitle: EText.yourAccountCreatedSubTitle,
          onpressed: () =>
             AuthenticationRepo.instance.screenRedirect(),
        ),
      );
    }
  }
}
