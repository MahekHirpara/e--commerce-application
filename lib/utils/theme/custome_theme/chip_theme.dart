import 'package:flutter/material.dart';

import '../../constant/color.dart';
class EChipTheme{
  EChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: EColors.black),
    selectedColor: EColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor: EColors.white,
  );
  static ChipThemeData darkChipTheme =  ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle:const TextStyle(color: Colors.black),
    selectedColor: EColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor: Colors.white,
  );
}