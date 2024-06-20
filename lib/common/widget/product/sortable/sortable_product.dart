import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/size.dart';
import '../../layout/grid_layout.dart';
import '../product_cart/product_cart_vertical.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            items: [
              'Name',
              'Higher Price Product',
              'Lower Price Product',
              'Sale',
              'Newest',
              'Popularity',
            ]
                .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {}),
        const SizedBox(
          height: ESize.spaceBtwSection,
        ),

        //Products
        EGrideLayout(
          itemCount: 6,
          itemBuilder: (_, index) {
            return const GridVertical();
          },
        ),
      ],
    );
  }
}