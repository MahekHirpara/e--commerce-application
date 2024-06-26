
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication_repo.dart';
import '../../conroller/singup_controller/verify_email_controller.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});
final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> AuthenticationRepo.instance.logout(), icon: const Icon(CupertinoIcons.clear),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
            //image
              Image(image:const AssetImage(EImages.deliveredEmailIllustration), width: EHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(EText.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(email ?? '',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(EText.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwSection,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.checkEmailVerificationStatus();
                  },
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: ESize.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
controller.sendEmailVerification();
                  },
                  child: const Text(EText.resendEmail),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


