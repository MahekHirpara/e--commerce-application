import 'package:flutter/material.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/product/cart_menu_icon.dart';
import '../../../../../utils/constant/color.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good day for Shopping',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: EColors.grey),
          ),
          Text(
            'mahek hirpara',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: EColors.white),
          ),
        ],
      ),
      actions: [
        ECartCounterIcon(
          onpressed: (){},
          iconColor: EColors.white,
        ),
      ],
    );
  }
}