import 'package:flutter/material.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../image/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../product_title_text.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      children: [
        ERoundedImage(
          imageurl: EImages.promo1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ESize.sm),
          backgroundColor: dark ? EColors.darkerGrey : EColors.light,
        ),
        const SizedBox(
          width: ESize.spaceBtwItems,
        ),

        //title,Price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const brantitle_text_with_verifyicon(title: 'Zara'),
              const Flexible(
                  child: EProductTitleText(
                title: 'Black ZARA Dress',
                maxline: 1,
              )),

              //Attribute

              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Black',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Small',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        ),
      ],
    );
  }
}
