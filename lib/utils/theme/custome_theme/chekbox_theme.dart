import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:flutter/material.dart';

class ECheckBoxTheme{
  ECheckBoxTheme._();

  static CheckboxThemeData LightBottomsheetTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
       return Colors.white;
      }else{
        return Colors.black;
      }
    }
    ),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return EColors.primary;
      }else{
        return Colors.transparent;
      }
    }),
  );
  static CheckboxThemeData DarkBottomsheetTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return EColors.primary;
        }else{
          return Colors.transparent;
        }
      })
  );
}

