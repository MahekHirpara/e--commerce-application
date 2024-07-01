import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/product/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widget/product/product_price.dart';
import '../../../../../utils/constant/size.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Obx(() {
      return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Obx(() {
              final item = cartController.cartItems[index];
              return Column(
                children: [
                  ECartItemForCart(
                    item: item,
                  ),
                  if (showAddRemoveButton)
                    const SizedBox(
                      height: ESize.spaceBtwItems,
                    ),
                  if (showAddRemoveButton)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70),
                            EProductQuantityWithAddRemove(
                              quality: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () =>
                                  cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        EProductPrice(price: (item.price* item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            });
          },
          separatorBuilder: (_, __) => const SizedBox(
                height: ESize.spaceBtwSection,
              ),
          itemCount: cartController.cartItems.length);
    });
  }
}
