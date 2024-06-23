import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentIndex = 0.obs;
  void updateIndicator(index){
    currentIndex.value = index;
  }
  void dotNavigationClick(index){
  currentIndex.value = index;
  pageController.jumpTo(index);
  }
  void nextPage(){
    if(currentIndex.value == 2){
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.to(const LoginScreen());
    }else{
      int page = currentIndex.value+1;
      pageController.jumpToPage(page);
    }
  }
  void skipPage(){
    currentIndex.value=2;
    pageController.jumpToPage(2);
  }
}