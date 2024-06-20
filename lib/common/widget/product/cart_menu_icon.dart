import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../features/shop/screen/cart/cart.dart';
import '../../../utils/constant/color.dart';
class ECartCounterIcon extends StatelessWidget {
  const ECartCounterIcon({
    super.key, required this.onpressed,  this.iconColor  = EColors.white,
  });

  final VoidCallback onpressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: (){ Get.to(()=>const CartScreen());},
          icon: const Icon(Iconsax.shopping_bag),color: iconColor,),
        Positioned(
          right: 2,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: dark ?  EColors.white :EColors.black,
            ),
            child: Center(
              child: Text(
                '2',
                style:  Theme.of(context).textTheme.labelLarge!.apply(color: dark ?  EColors.black :EColors.white,fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}