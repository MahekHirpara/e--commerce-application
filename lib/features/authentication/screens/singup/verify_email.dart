import 'package:e_commerce_app/common/widget_login_sing_up/success.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(()=>LOginScreen()), icon: const Icon(CupertinoIcons.clear),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
            //image
              Image(image:AssetImage(EImages.EmailVerify1), width: EHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(EText.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text('mahekhirpara63@gmail.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwItems,),
              Text(EText.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: ESize.spaceBtwSection,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(()=> SuccessScreen(image: EImages.EmailSuccess, title: EText.yourAccountCreatedTitle, subTitle: EText.yourAccountCreatedSubTitle, onpressed: ()=>Get.to(() => LOginScreen())));
                  },
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: ESize.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {

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


