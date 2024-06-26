import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class ECategoryShimmerEffect extends StatelessWidget {
  const ECategoryShimmerEffect({super.key,
    this.itemCount =6});

 final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

          separatorBuilder: (_,__) => const SizedBox(width: ESize.spaceBtwItems,),
          itemCount: itemCount,
        itemBuilder: (_,__){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EShimmerEffect(width: 55, height: 55,radius: 55,),
              SizedBox(height: ESize.spaceBtwItems/2,),

              EShimmerEffect(width: 55, height: 0)
            ],
          );
        }
      ),
    );


  }
}
