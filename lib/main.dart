
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/authentication/screens/on_boarding_screens/onbording.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  @override
const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.DarkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
