import 'package:e_commerce_app/common/style/shadow.dart';
import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/image/rounded_image.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';
import '../../icons/ECircleIcon.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';
import '../product_price.dart';

class GridVertical extends StatelessWidget {
  const GridVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap:(){
        Get.to(() => const ProductDetails());
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESize.productImageRadius),
          color: dark ? EColors.dark : EColors.light,
        ),
        child: Column(
          children: [
            //thumbnail
            ECircularContainer(
                height: 180,
                padding: const EdgeInsets.all(ESize.xs),
                backgroundColor: dark ? EColors.dark : EColors.light,
                child: Stack(
                  children: [
                    const ERoundedImage(
                      imageurl: EImages.shoes1,
                      applyimageRadius: true,
                      fit: BoxFit.cover,
                    ),
                    //Sale Tag
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
                    //whishlist
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: ECircleButton(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )),
            //Details
            Padding(
                padding: const EdgeInsets.only(left: ESize.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitleText(
                      title: 'Black Nike Shoes',
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: ESize.spaceBtwItems / 2,
                    ),
                    BrandTExtWithVerifyIcon(title: 'Nike'),

                  ],
                ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                const Padding(
                  padding: EdgeInsets.only(left: ESize.sm),
                  child: EProductPrice(price: '35.5',isLarge: true,),
                ),

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
                      width: ESize.iconslg *1.2,
                      height: ESize.iconslg *1.2,
                      child: Icon(
                        Iconsax.add,
                        color: EColors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


