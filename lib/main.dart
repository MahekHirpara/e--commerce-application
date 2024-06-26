import 'package:e_commerce_app/Routs/app_routs.dart';
import 'package:e_commerce_app/binding/general_binding.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication_repo.dart';
import 'firebase_options.dart';

Future<void> main() async {
  ///widget initialization
  final WidgetsBinding widgetsBinding= WidgetsFlutterBinding.ensureInitialized();

  ///init local Storage
  await GetStorage.init();

  ///Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepo()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      getPages: AppRouts.pages,
      home: const Scaffold(backgroundColor: EColors.primary,body: Center(child: CircularProgressIndicator(color : Colors.white)),),
    );
  }
}
