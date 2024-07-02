import 'package:e_commerce_app/common/widget/brand_cart/brand_show_case.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/modal/category_modal.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/box_shimmer.dart';
import '../../../../../common/widget/list_tile_shimmer.dart';
class CategoryBrands extends StatelessWidget {
  const  CategoryBrands({super.key, required this.category});

  final CategoriesModal category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            EListTileShimmer(),
            SizedBox(height: ESize.spaceBtwItems,),
            EBoxesShimmer(),
          SizedBox(height: ESize.spaceBtwItems,),
          ],
        );
        final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
        if(widget != null) return widget;

        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_,index){
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProduct(brandId: brand.id),
              builder: (context, snapshot) {
                final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
                if(widget != null) return widget;

                final product = snapshot.data!;
                return EBrandShowCase(images: product.map((e) => e.thumbnail).toList(),brand: brand,);
              }
            );
            }
        );

      }
    );
  }
}
