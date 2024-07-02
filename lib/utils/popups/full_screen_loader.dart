import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/loaders/animation_loader.dart';
import '../constant/color.dart';

class EFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: EHelperFunction.isDarkMode(Get.context!) ? EColors.dark : EColors.light,
          width: double.infinity,
          height:  double.infinity,
          child:Column(
            children: [
              Expanded(child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20,),
                  EAnimationLoaderWidget(text:text,animation:animation)
                ],
              ), ),
            ],
          )

        ),
      ),
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
