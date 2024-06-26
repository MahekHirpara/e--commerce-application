import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_app/features/shop/modal/category_modal.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/brand_cart/brand_show_case.dart';
import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';

class ECatogoryTab extends StatelessWidget {
  const ECatogoryTab({super.key, required this.category});

  final CategoriesModal category;


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
              const EBrandShowCase(images: [EImages.promoBanner2,EImages.promoBanner1,EImages.promoBanner3],),
              const EBrandShowCase(images: [EImages.promoBanner1,EImages.promoBanner2,EImages.promoBanner3],),
              //products
              ESectionHeading(text: 'You might like',onPressed: (){},),
              const SizedBox(height: ESize.spaceBtwItems,),

              EGrideLayout(
                itemCount: 4,
                  itemBuilder: (_,index){
                  return  GridVertical(product: ProductModal.empty(),);
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
