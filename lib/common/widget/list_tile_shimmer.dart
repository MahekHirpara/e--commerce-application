import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

class EListTileShimmer extends StatelessWidget {
  const EListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EShimmerEffect(width: 50, height: 50),
            SizedBox(width: ESize.spaceBtwItems,),
            Column(
              children: [
                EShimmerEffect(width: 100, height: 15),
                SizedBox(width: ESize.spaceBtwItems/2,),
                EShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
