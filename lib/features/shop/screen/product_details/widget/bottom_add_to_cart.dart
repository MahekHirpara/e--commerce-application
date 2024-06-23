import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/icons/ECircleIcon.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class EBottomAddToCart extends StatelessWidget {
  const EBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ESize.defaultSpace, vertical: ESize.defaultSpace),
      decoration: BoxDecoration(
          color: dark ? EColors.darkerGrey : EColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ESize.cardRadiusLg),
            topRight: Radius.circular(ESize.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ECircleButton(
                icon: Iconsax.minus,
                backgroundColor: EColors.darkGrey,
                width: 40,
                height: 40,
                color: EColors.white,
              ),
              const SizedBox(
                width: ESize.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: ESize.spaceBtwItems,
              ),
              const ECircleButton(
                icon: Iconsax.add,
                backgroundColor: EColors.black,
                width: 40,
                height: 40,
                color: EColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(ESize.md),
              backgroundColor: EColors.black,
              side: const BorderSide(color: EColors.black),
            ),
            child: const Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
