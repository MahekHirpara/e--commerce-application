import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/constant/size.dart';
import '../../../utils/helper/helper_function.dart';
import '../custom_shap/container/circular_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ECircularContainer(
      showBorder: true,
      borderColor: EColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESize.md),
      margin: const EdgeInsets.only(bottom: ESize.spaceBtwItems),
      child: Column(
        children: [
          //brand with product count
          const EBrandcard(showborder: false),
          Row(
              children: images.map((image) => bradTopProductImageWidget(image, context)).toList(),
          )
          //brand top 3 products
        ],
      ),
    );
  }
}

Widget bradTopProductImageWidget(String image, context) {
  return Expanded(
    child: ECircularContainer(
      height: 100,
      backgroundColor: EHelperFunction.isDarkMode(context) ? EColors.darkerGrey : EColors.light,
      margin: const EdgeInsets.only(right: ESize.sm),
      padding: const EdgeInsets.all(ESize.md),
      child:  Image(
        fit: BoxFit.cover,
        image: AssetImage(image),
      ),
    ),);
}