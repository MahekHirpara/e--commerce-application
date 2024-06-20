import 'package:e_commerce_app/utils/device/devise_utility.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';

class ETabbar extends StatelessWidget implements PreferredSizeWidget{

  const ETabbar({super.key,required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context){
    final dark = EHelperFunction.isDarkMode(context);
    return Material(
      color: dark ? EColors.black : EColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: EColors.primary,
        labelColor: dark ? EColors.white:EColors.primary,
        unselectedLabelColor: EColors.darkerGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBArHeight());
}