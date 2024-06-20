import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/product/product_price.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/chip/EChoice_chip.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/helper_function.dart';

class EProductAttribute extends StatelessWidget {
  const EProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        //Selected Attributr Pricing & Description
        ECircularContainer(
          padding: const EdgeInsets.all(ESize.md),
          backgroundColor: dark ? EColors.darkerGrey : EColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title,Price and Stock Status
              Row(
                children: [
                  const ESectionHeading(
                    text: 'Variation',
                    showActionbutton: false,
                  ),
                  const SizedBox(
                    width: ESize.spaceBtwItems,
                  ),
                  //Actual Price
                  Column(
                    children: [
                      //price
                      Row(
                        children: [
                          const EProductTitleText(
                            title: 'Price',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: ESize.spaceBtwItems,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: ESize.spaceBtwItems,
                          ),
                          //Sale Price
                          const EProductPrice(
                            price: '20',
                          ),
                        ],
                      ),
                      //stock
                      Row(
                        children: [
                          const EProductTitleText(
                            title: 'Stock',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: ESize.spaceBtwItems,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              //variation
              const EProductTitleText(
                title:
                    'This is the Description of the Product and it can go upto max 4 line',
                smallSize: true,
                maxline: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ESize.spaceBtwSection/2.5,),

        //Attribute
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              text: 'Color',
              showActionbutton: false,
            ),
            const SizedBox(
              height: ESize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                EChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                EChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(
              text: 'Size',
              showActionbutton: false,
            ),
            const SizedBox(
              height: ESize.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                EChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                EChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
