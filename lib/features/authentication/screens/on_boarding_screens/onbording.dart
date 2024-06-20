import 'package:e_commerce_app/features/authentication/conroller,onbording/controller_onbording.dart';
import 'package:e_commerce_app/features/authentication/screens/on_boarding_screens/widgets/onBoardinNextButton.dart';
import 'package:e_commerce_app/features/authentication/screens/on_boarding_screens/widgets/onBoardingDotNavigation.dart';
import 'package:e_commerce_app/features/authentication/screens/on_boarding_screens/widgets/onBoardingSkip.dart';
import 'package:e_commerce_app/features/authentication/screens/on_boarding_screens/widgets/onboarding_page.dart';

import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updateIndicator,
            children: const [
              onBoardingPage(
                image: EImages.onBoardingImage1,
                title: EText.onBoardingTitle1,
                subTitle: EText.onBoardingSubTitle1,
              ),
              onBoardingPage(
                image: EImages.onBoardingImage2,
                title: EText.onBoardingTitle2,
                subTitle: EText.onBoardingSubTitle2,
              ),
              onBoardingPage(
                image: EImages.onBoardingImage3,
                title: EText.onBoardingTitle3,
                subTitle: EText.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const onBoardingNextButton()
        ],
      ),
    );
  }
}
