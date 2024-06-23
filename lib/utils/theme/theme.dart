import 'package:e_commerce_app/utils/theme/custome_theme/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/bottomsheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/chekbox_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/elevetedButton_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/outlineButton_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/textFeild_theme.dart';
import 'package:e_commerce_app/utils/theme/custome_theme/text_theme.dart';
import 'package:flutter/material.dart';
class AppTheme{
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ETextTheme.lightTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EAppbarTheme.lightAppbarTheme,
    checkboxTheme: ECheckBoxTheme.lightBottomsheetTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomsheetTheme,
    chipTheme: EChipTheme.lightChipTheme,
    outlinedButtonTheme: EOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: ETextfeildTheme.lightTextFieldTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ETextTheme.darkTextTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EAppbarTheme.darkAppbarTheme,
    checkboxTheme: ECheckBoxTheme.darkBottomsheetTheme,
    bottomSheetTheme: EBottomSheetTheme.darkBottomsheetTheme,
    chipTheme: EChipTheme.darkChipTheme,
    outlinedButtonTheme: EOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: ETextfeildTheme.darkTextFieldTheme,
  );
}