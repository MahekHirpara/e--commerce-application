import 'package:e_commerce_app/features/authentication/conroller/forget_controller/forget_password_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/text.dart';
import '../../../../utils/helper/helper_function.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(image:const AssetImage(EImages.emailVerify1), width: EHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: ESize.spaceBtwItems,),

              Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(EText.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),

              Text(EText.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwSection,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:(){
                    Get.offAll(const LoginScreen());
                  },
                  child: const Text('Done'),
                ),
              ),
              const SizedBox(height: ESize.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed:(){
                    ForgetPasswordController.instance.resendPasswordResetEmail(email);
                  },
                  child: const Text('Resend'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
