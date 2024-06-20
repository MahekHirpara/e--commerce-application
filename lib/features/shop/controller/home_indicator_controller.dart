import 'package:get/get.dart';

class HomeIndicatorController extends GetxController{

  static HomeIndicatorController get instance => Get.find();

  final currentIndex =0.obs;

  void updatePageIndicator(index){
    currentIndex.value = index;
  }
}