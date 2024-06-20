import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/device/devise_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/helper/helper_function.dart';
class EAppBar extends StatelessWidget implements PreferredSizeWidget{
  const EAppBar({
    super.key,
    this.title,
     this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed});
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: ESize.md),
      child: AppBar(
        automaticallyImplyLeading: false,
          leading:  showBackArrow ? IconButton(onPressed: () => Get.back(), icon:  Icon(Iconsax.arrow_left,color: dark ? EColors.white : EColors.black,))
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon:  Icon(leadingIcon)) :null,
        title: title,
        actions: actions,
      ),
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBArHeight());
}
