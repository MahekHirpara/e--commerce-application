import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helper/pricing.dart';

class EBillingAmountSection extends StatelessWidget {
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$$subTotal',style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        //Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${EPricing.calculateShippingCost(subTotal, 'US')}',style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        //Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${EPricing.calculateTax(subTotal, 'US')}',style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        //order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${EPricing.calculateTotalPrice(subTotal, 'US')}',style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
      ],
    );
  }
}