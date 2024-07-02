import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';

class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: ESize.spaceBtwSection),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
          separatorBuilder: (context,index) => const SizedBox(width: ESize.spaceBtwItems,),
        itemBuilder: (_,__) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            EShimmerEffect(width: 120, height: 120),
            SizedBox(width: ESize.spaceBtwItems,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: ESize.spaceBtwItems/2,),
                EShimmerEffect(width: 160, height: 15),
                SizedBox(height: ESize.spaceBtwItems/2,),
                EShimmerEffect(width: 110, height: 15),
                SizedBox(height: ESize.spaceBtwItems/2,),
                EShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),

      ),
    );
  }
}
