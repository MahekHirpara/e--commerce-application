import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../icons/ECircleIcon.dart';

class EProductQuantityWithAddRemove extends StatelessWidget {
  const EProductQuantityWithAddRemove({
    super.key,
    required this.quality,
    required this.add,
    required this.remove,
  });

  final int quality;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ECircleButton(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ESize.md,
          color: dark ? EColors.white : EColors.black,
          backgroundColor: dark ? EColors.darkerGrey : EColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: ESize.spaceBtwItems),
        Text(quality.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ESize.spaceBtwItems),
         ECircleButton(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ESize.md,
          color: EColors.white,
          backgroundColor: EColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
