import 'package:flutter/material.dart';

class EOutlineButtonTheme {
  EOutlineButtonTheme._();

  static OutlinedButtonThemeData lightOutlineButtonTheme = OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: const BorderSide(color:Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );
  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: const BorderSide(color:Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );
}