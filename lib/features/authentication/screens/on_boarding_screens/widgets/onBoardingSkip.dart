
import 'package:flutter/material.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/device/devise_utility.dart';
import '../../../conroller/controller_onbording.dart';


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
