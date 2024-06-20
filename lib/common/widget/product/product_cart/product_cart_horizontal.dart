import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/brand_title_with_verify_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../../style/shadow.dart';
import '../../icons/ECircleIcon.dart';
import '../../image/rounded_image.dart';
import '../product_price.dart';

class EProductCardHorizontal extends StatelessWidget {
  const EProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(ESize.productImageRadius),
        color: dark ? EColors.darkerGrey : EColors.lightContainer,
      ),
      child: Row(
        children: [
          //thumbnail
          ECircularContainer(
            height: 120,
            padding: const EdgeInsets.all(ESize.sm),
            backgroundColor: dark ? EColors.darkerGrey : EColors.lightContainer,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: ERoundedImage(
                    imageurl: EImages.promo2,
                    applyimageRadius: true,
                    fit: BoxFit.cover,
                  ),
                ),

                //sale Tag
                Positioned(
                  top: 12,
                  child: ECircularContainer(
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
                ),

                //wishlist
                const Positioned(
                  top: 0,
                  right: 0,
                  child: ECircaleButton(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          //Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ESize.sm, left: ESize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EProductTitleText(
                        title: 'Black nike shoes',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: ESize.spaceBtwItems / 2,
                      ),
                      brantitle_text_with_verifyicon(title: 'Nike'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: EProductPrice(
                        price: '35.5-256678943',
                        isLarge: true,
                      )),

                      //add to cark
                      Container(
                        decoration: BoxDecoration(
                          color: dark ? EColors.primary : EColors.black,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(ESize.cardRadiusMd),
                            bottomRight:
                                Radius.circular(ESize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: ESize.iconslg * 1.2,
                            height: ESize.iconslg * 1.2,
                            child: Icon(
                              Iconsax.add,
                              color: EColors.white,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
