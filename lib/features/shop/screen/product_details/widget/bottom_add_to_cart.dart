import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/icons/ECircleIcon.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';
import '../../../modal/product_modal.dart';

class EBottomAddToCart extends StatelessWidget {
  const EBottomAddToCart({super.key, required this.product});
final ProductModal product;
  @override
  Widget build(BuildContext context) {
    final cardController = Get.put(CartController());
    cardController.updateAlreadyAddedProductCount(product);
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ESize.defaultSpace, vertical: ESize.defaultSpace),
      decoration: BoxDecoration(
          color: dark ? EColors.darkerGrey : EColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ESize.cardRadiusLg),
            topRight: Radius.circular(ESize.cardRadiusLg),
          )),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                   ECircleButton(
                    icon: Iconsax.minus,
                    backgroundColor: EColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: EColors.white,
                    onPressed: () => cardController.productQuantityInCart.value < 1 ? null : cardController.productQuantityInCart.value -=1,
                  ),
                  const SizedBox(
                    width: ESize.spaceBtwItems,
                  ),
                  Text(
                    cardController.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: ESize.spaceBtwItems,
                  ),
                   ECircleButton(
                    icon: Iconsax.add,
                    backgroundColor: EColors.black,
                    width: 40,
                    height: 40,
                    color: EColors.white,
                     onPressed: () =>cardController.productQuantityInCart.value +=1,
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                cardController.productQuantityInCart <1 ? null : cardController.addCart(product);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ESize.md),
                backgroundColor: EColors.black,
                side: const BorderSide(color: EColors.black),
              ),
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
