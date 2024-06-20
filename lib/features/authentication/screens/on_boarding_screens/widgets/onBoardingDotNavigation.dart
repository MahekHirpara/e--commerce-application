import 'package:e_commerce_app/features/authentication/conroller,onbording/controller_onbording.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/device/devise_utility.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= OnBoardingController.instance;
    final dark = EHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: EDeviceUtils.getBottomNavigationBarHeight()+25,
      left: ESize.defaultSpace,

      child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(activeDotColor: dark ? EColors.light : EColors.dark,dotHeight: 6, )
      ),
    );
  }
}
