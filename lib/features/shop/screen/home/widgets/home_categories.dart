import 'package:e_commerce_app/features/shop/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/category_shimmer.dart';
import '../../../../../common/widget/image_text/image_text.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../sub-categories/sub_categories.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return
      Obx(
        () {
          if(controller.isLoading.value) return const ECategoryShimmerEffect();
          if(controller.featuredCategories.isEmpty){
            return Center(child: Text('Data not Found',style:Theme.of(context).textTheme.bodyMedium!.apply(color:Colors.white),),);
          }
            return SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = controller.featuredCategories[index];
                    return EverticalIconText(
                      images: category.image,
                      title: category.name,
                      onTap: () {
                        Get.to(() => const SubCategoriesScreen());
                      },

                    );
                  },),

            );
          }
      );
  }
}