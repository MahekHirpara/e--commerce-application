import 'package:e_commerce_app/features/authentication/conroller,onbording/controller_onbording.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/device/devise_utility.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: EDeviceUtils.getAppBArHeight(),
        right: ESize.defaultSpace,
        child: TextButton(
          onPressed: (){
            OnBoardingController.instance.skipPage();
          },
          child: const Text('Skip'),
        )
    );
  }
}
