import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProcessingLoader{
  static void openLoadingDialog(String text){
    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: EColors.primary,),
          const SizedBox(height: ESize.spaceBtwSection,),
          Text(text),
        ],
      ),
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
