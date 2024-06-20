import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/device/devise_utility.dart';
import '../../../../../utils/helper/helper_function.dart';
import '../../../conroller,onbording/controller_onbording.dart';



class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Positioned(
        right: ESize.defaultSpace,
        bottom: EDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: (){
            OnBoardingController.instance.nextPage();
          },
          style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark? EColors.primary : EColors.black,),
          child: const Icon(Iconsax.arrow_right_3),
        )
    );
  }
}
