import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/fav_icon/favourite_icon.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controller/product_controller.dart';
import '../../../../utils/constant/color.dart';
import 'package:get/get.dart';
import '../../../../utils/constant/enums.dart';
import '../../../../utils/constant/size.dart';
import '../../../../utils/helper/helper_function.dart';

import '../../image/rounded_image.dart';
import '../product_price.dart';

class EProductCardHorizontal extends StatelessWidget {
  const EProductCardHorizontal({super.key, required this.product});

  final ProductModal product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
                 SizedBox(
                  height: 120,
                  width: 120,
                  child: ERoundedImage(
                    imageurl: product.thumbnail,
                    applyimageRadius: true,
                    fit: BoxFit.cover,
                    isNetworkImage: true,
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
                      '$salePercentage%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: EColors.black),
                    ),
                  ),
                ),

                //wishlist
                 Positioned(
                  top: 0,
                  right: 0,
                  child: EFavouriteIcon(productId: product.id),
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
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(
                        height: ESize.spaceBtwItems / 2,
                      ),
                       BrandTExtWithVerifyIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(product.productType == ProductType.single.toString() && product.salePrice >0)
                              Padding(
                                padding: const EdgeInsets.only(left: ESize.sm),
                                child: Text(product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: ESize.sm),
                              child: EProductPrice(price: controller.getProductPrice(product) ,),
                            ),
                          ],
                        ),),



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
                          ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
