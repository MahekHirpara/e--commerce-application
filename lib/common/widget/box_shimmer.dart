import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

class EBoxesShimmer extends StatelessWidget {
  const EBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EShimmerEffect(width: 150, height: 100)),
            SizedBox(
              width: ESize.spaceBtwItems,
            ),
            Expanded(child: EShimmerEffect(width: 150, height: 100)),
            SizedBox(
              width: ESize.spaceBtwItems,
            ),
            Expanded(child: EShimmerEffect(width: 150, height: 100)),
            SizedBox(
              width: ESize.spaceBtwItems,
            ),
          ],
        )
      ],
    );
  }
}
