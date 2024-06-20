import 'package:e_commerce_app/common/widget/image/circularImage.dart';
import 'package:e_commerce_app/common/widget/product/product_price.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';

class EProductMEtaData extends StatelessWidget {
  const EProductMEtaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            //Sale TAg
            ECircularContainer(
              radius: ESize.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ESize.sm, vertical: ESize.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: EColors.black),
              ),
            ),
            const SizedBox(width: ESize.spaceBtwItems,),

            //price
            Text('\$200',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: ESize.spaceBtwItems,),
            const EProductPrice(price: '175',isLarge: true,),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/1.5,),

        //Title
        const EProductTitleText(title: 'Black Zara Dress'),
        const SizedBox(height: ESize.spaceBtwItems/1.5,),
        
        //Stock Status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESize.spaceBtwItems,),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        
        const SizedBox(height: ESize.spaceBtwItems/1.5,),

        //Brand
        Row(
          children: [
            ECircularImage(
                image: EImages.cosmatic,
              width: 32,
                height: 32,
              overlayColor: dark ? EColors.white : EColors.black,
            ),
            const SizedBox(height: ESize.spaceBtwItems/1.5,),
            const brantitle_text_with_verifyicon(title: "ZARA",brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
