import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

class EVerticalProductShimmer extends StatelessWidget {
  const EVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGrideLayout(
        itemCount: itemCount, itemBuilder: (_, __) => const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image
          EShimmerEffect(width: 180, height: 180),
          SizedBox(height: ESize.spaceBtwItems,),

          //text
          EShimmerEffect(width: 160, height: 15),
          SizedBox(height: ESize.spaceBtwItems/2,),
          EShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
