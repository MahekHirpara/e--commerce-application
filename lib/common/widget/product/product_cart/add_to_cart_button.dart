import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screen/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../features/shop/modal/product_modal.dart';
import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/size.dart';


class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModal product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        //if the product have variation then show product details for variation
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }else{
          //else add to cart
          Get.to(()=>ProductDetails(product: product));
        }

      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
            return Container(
              decoration: BoxDecoration(
                color: productQuantityInCart > 0 ? EColors.primary : Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(ESize.cardRadiusMd),
                  bottomRight: Radius.circular(ESize.productImageRadius),
                ),
              ),
              child:  SizedBox(
                width: ESize.iconslg * 1.2,
                height: ESize.iconslg * 1.2,
                child: productQuantityInCart >0 ? Center(child: Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color:EColors.white),)):
                const Icon(
                  Iconsax.add,
                  color: EColors.white,
                ),
              ),
            );
          }
      ),
    );
  }
}