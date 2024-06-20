import 'package:e_commerce_app/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/features/shop/screen/store/store.dart';
import 'package:e_commerce_app/features/shop/screen/wishlist/wishlist.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screen/personalition/screens/setting/setting.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
            selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>controller.selectedIndex.value = index,
          backgroundColor: dark ? EColors.black : EColors.white,
          indicatorColor:  dark ? EColors.white.withOpacity(0.1) : EColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home,), label: 'Home',),
            NavigationDestination(icon: Icon(Iconsax.shop,), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart,), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user,), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
          () => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;
  final screens=[
    const HomeScreen(),
    const Store(),
    const FavouriteScreen(),
    const SettingScreen(),
  ];
}


