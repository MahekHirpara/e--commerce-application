import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/device/devise_utility.dart';
import '../../../../utils/helper/helper_function.dart';

class ESearchBar extends StatelessWidget {
  const ESearchBar({
    super.key,
    required this.text,
    this.icon=Iconsax.search_normal,
    this.showBackground=true,
    this.showBorder = true,
    this.onTap,
    this.padding =const EdgeInsets.symmetric(horizontal: ESize.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground,showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final dark =EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding! ,
        child: Container(
          width: EDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ESize.md),
          decoration: BoxDecoration(
            color: showBackground? dark? EColors.dark :EColors.light:Colors.transparent,
            borderRadius: BorderRadius.circular(ESize.cardRadiusLg),
            border: showBorder? Border.all(color: EColors.grey):null,
          ),
          child: Row(
            children: [
              Icon(icon,color: EColors.darkerGrey,),
              const SizedBox(width: ESize.spaceBtwItems,),
              Text(text,style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
        ),
      ),
    );
  }
}