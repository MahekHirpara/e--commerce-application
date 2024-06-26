import 'package:e_commerce_app/features/authentication/conroller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constant/color.dart';
import '../../utils/constant/image_string.dart';
import '../../utils/constant/size.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){
           controller.googleSignIn();
            },
            icon: const Image(
              width: ESize.iconsMd,
              height: ESize.iconsMd,
              image: AssetImage(EImages.google),
            ),
          ),
        ),
        const SizedBox(width: ESize.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: EColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: ESize.iconsMd,
              height: ESize.iconsMd,
              image: AssetImage(EImages.facebook),
            ),
          ),
        ),

      ],
    );
  }
}
