

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EDeviceUtils{

  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }


  static double getBottomNavigationBarHeight(){
    return kBottomNavigationBarHeight;
  }
  static double getAppBArHeight(){
    return kToolbarHeight;
  }
  static double getKeyboardHeight(){
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }


  static Future<bool> isPhysicalDevice() async{

    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  
  static bool isIos(){
    return Platform.isIOS;
  }
  
  static bool isAndroid(){
    return Platform.isAndroid;
  }
  
  static void lanchUrl(String url) async{
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }else{
      throw 'could not launch $url';
    }
  }
}

