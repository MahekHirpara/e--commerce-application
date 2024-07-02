import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_app/common/widget/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/modal/category_modal.dart';
import 'package:e_commerce_app/features/shop/screen/all_product/all_product.dart';
import 'package:e_commerce_app/features/shop/screen/store/widget/category_brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/text/section_heading.dart';

import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/cloud_helper_function.dart';

class ECatogoryTab extends StatelessWidget {
  const ECatogoryTab({super.key, required this.category});

  final CategoriesModal category;


  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //brands
              CategoryBrands(category: category),
              const SizedBox(height: ESize.spaceBtwItems,),

              // products
              FutureBuilder(
                future: controller.getCategoryProduct(categoryId: category.id),
                builder: (context, snapshot) {
                  final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: const EVerticalProductShimmer());
                  if(widget != null) return widget;

                  final product = snapshot.data!;
                  return Column(
                    children: [
                      ESectionHeading(text: 'You might like',onPressed: (){
                        Get.to((AllProductScreen(title: category.name,futureMethod: controller.getCategoryProduct(categoryId: category.id,limit: -1),)));
                      },),
                      const SizedBox(height: ESize.spaceBtwItems,),
                      EGrideLayout(
                        itemCount: product.length,
                        itemBuilder: (_,index){
                          return  GridVertical(product: product[index],);
                        },

                      ),
                    ],
                  );
                }
              ),

              const SizedBox(height: ESize.spaceBtwSection,),
            ],
          ),
        ),
      ],
    );
  }
}
