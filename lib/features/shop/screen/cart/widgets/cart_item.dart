import 'package:flutter/material.dart';

import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/product/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widget/product/product_price.dart';
import '../../../../../utils/constant/size.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({super.key,  this.showAddRemoveButton=true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return  Column(
            children: [
              const ECartItem(),
              if(showAddRemoveButton) const SizedBox(
                height: ESize.spaceBtwItems,
              ),
              if(showAddRemoveButton) const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      EProductQuantityWithAddRemove(),
                    ],
                  ),
                  EProductPrice(price: '256'),

                ],
              ),

            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: ESize.spaceBtwSection,
        ),
        itemCount: 2);
  }
}
