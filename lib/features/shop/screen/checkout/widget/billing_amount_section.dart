import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

class EBillingAmountSection extends StatelessWidget {
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$255.0',style: Theme.of(context).textTheme.bodyMedium,
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
              '\$6.0',style: Theme.of(context).textTheme.labelMedium,
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
              '\$6.0',style: Theme.of(context).textTheme.labelMedium,
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
              '\$267.0',style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/2,),
      ],
    );
  }
}