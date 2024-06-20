import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/product_cart/product_cart_vertical.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/brand_cart/brand_show_case.dart';
import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';

class ECatogoryTab extends StatelessWidget {
  const ECatogoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //brands
              const EBrandShowCase(images: [EImages.shoes1,EImages.promo1,EImages.promo2],),
              const EBrandShowCase(images: [EImages.shoes1,EImages.promo1,EImages.promo2],),
              //products
              ESectionHeading(text: 'You might like',onPressed: (){},),
              const SizedBox(height: ESize.spaceBtwItems,),

              EGrideLayout(
                itemCount: 4,
                  itemBuilder: (_,index){
                  return const GridVertical();
                  },

              ),
              const SizedBox(height: ESize.spaceBtwSection,),
            ],
          ),
        ),
      ],
    );
  }
}
