import 'package:e_commerce_app/common/style/shadow.dart';
import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/fav_icon/favourite_icon.dart';
import 'package:e_commerce_app/common/widget/image/rounded_image.dart';
import 'package:e_commerce_app/features/shop/controller/product_controller.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
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
import 'add_to_cart_button.dart';

class GridVertical extends StatelessWidget {
  const GridVertical({
    super.key,
    required this.product,
  });

  final ProductModal product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(
              product: product,
            ));
      },
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESize.productImageRadius),
          color: dark ? EColors.dark : EColors.light,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //thumbnail
            ECircularContainer(
                height: 180,
                width: 180,
                padding: const EdgeInsets.all(ESize.xs),
                backgroundColor: dark ? EColors.dark : EColors.light,
                child: Stack(
                  children: [
                    Center(
                      child: ERoundedImage(
                        imageurl: product.thumbnail,
                        applyimageRadius: true,
                        fit: BoxFit.cover,
                        isNetworkImage: true,
                      ),
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
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: EColors.black),
                        ),
                      ),
                    ),
                    //whishlist
                    Positioned(
                      top: 0,
                      right: 0,
                      child: EFavouriteIcon(productId: product.id),
                    ),
                  ],
                )),
            //Details
            Padding(
              padding: const EdgeInsets.only(left: ESize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: ESize.spaceBtwItems / 2,
                  ),
                  BrandTExtWithVerifyIcon(title: product.brand!.name),
                ],
              ),
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
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: ESize.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: ESize.sm),
                        child: EProductPrice(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
                  ),
                ),

                //add to cart
                ProductCardAddToCartButton(product: product,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


