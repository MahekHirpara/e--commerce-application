import 'package:e_commerce_app/features/shop/modal/cart_item_modal.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../image/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../product_title_text.dart';

class ECartItemForCart extends StatelessWidget {
  const ECartItemForCart({
    super.key,
    required this.item,
  });

  final CartItemModal item;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      children: [
        ERoundedImage(
          imageurl: item.images ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
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
              BrandTExtWithVerifyIcon(title: item.brandName ?? ''),
              Flexible(
                  child: EProductTitleText(
                title: item.title,
                maxline: 1,
              )),

              //Attribute

              Text.rich(
                TextSpan(
                    children: (item.selectedVariation ?? {})
                        .entries
                        .map(
                          (e) => TextSpan(
                            children: [
                              TextSpan(
                                  text: '${e.key}',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${e.value}',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
