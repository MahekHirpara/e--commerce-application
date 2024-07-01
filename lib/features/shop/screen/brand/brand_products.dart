import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/brand_cart/brand_card.dart';
import 'package:e_commerce_app/common/widget/product/sortable/sortable_product.dart';
import 'package:e_commerce_app/common/widget/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/modal/brand_modal.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/size.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModal brand;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BrandController());
    return  Scaffold(
      appBar:  EAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              EBrandcard(showborder: true,brand: brand,),
              const SizedBox(height: ESize.spaceBtwSection,),

              //sortable products
              FutureBuilder(
                future: controller.getBrandProduct( brandId: brand.id,),
                builder: (context, snapshot) {
                  const loader = EVerticalProductShimmer();
                  final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null ) return widget;

                  final brandProduct = snapshot.data!;
                  return  ESortableProducts(products: brandProduct,);
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
