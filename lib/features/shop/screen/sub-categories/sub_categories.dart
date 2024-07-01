import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/horizontal_product_shimmer.dart';
import 'package:e_commerce_app/common/widget/image/rounded_image.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/features/shop/modal/category_modal.dart';
import 'package:e_commerce_app/features/shop/screen/all_product/all_product.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/product/product_cart/product_cart_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoriesModal category;

  @override
  Widget build(BuildContext context) {
    final  controller = CategoryController.instance;
    return Scaffold(
      appBar:  EAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //banner
               ERoundedImage(
                imageurl: category.thumbnail!,
                width: double.infinity,
                applyimageRadius: true,
                 isNetworkImage: true,
              ),
              const SizedBox(
                height: ESize.spaceBtwSection,
              ),

              //Sub-categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  const loader = EHorizontalProductShimmer();
                  final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
                  if(widget != null) return widget;

                  final subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                      itemBuilder: (_,index){

                      final subCategory = subCategories[index];
                        return FutureBuilder(
                          future: controller.getCategoryProduct(categoryId: subCategory.id),
                          builder: (context, snapshot) {

                            final widget = ECloudHelperFunction.checkMultipleRecordState(snapshot: snapshot,loader: loader);
                            if(widget != null) return widget;

                            final subCategoriesProduct = snapshot.data!;
                            return Column(
                              children: [
                                ESectionHeading(
                                  text: subCategory.name,
                                  showActionbutton: true,
                                  onPressed: () {
                                    Get.to(() => AllProductScreen(title: subCategory.name,futureMethod: controller.getCategoryProduct(categoryId: subCategory.id,limit: -1)));
                                  },
                                ),
                                const SizedBox(
                                  height: ESize.spaceBtwSection,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return  EProductCardHorizontal(product : subCategoriesProduct[index]);
                                      },
                                      separatorBuilder: (_, __) => const SizedBox(
                                        width: ESize.spaceBtwItems,
                                      ),
                                      itemCount: subCategoriesProduct.length,
                                  ),
                                )
                              ],
                            );
                          }
                        );
                      },
                  );
                  
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
