import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/features/shop/controller/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../common/widget/image/rounded_image.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        (){
          if(controller.isLoading.value) return const EShimmerEffect(width: double.infinity, height: 190);

          if(controller.allBanners.isEmpty){
            return const Center(child: Text('No Data Found'),);
          }else{
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index)),
                  items: controller.allBanners
                      .map((banner) => ERoundedImage(
                    imageurl: banner.image,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(banner.targetSearch),
                    applyimageRadius: true,
                    fit: BoxFit.cover,
                    padding: const EdgeInsets.only(right: ESize.sm),
                  ))
                      .toList(),
                ),
                const SizedBox(height: ESize.spaceBtwItems),
                Center(
                  child: Obx(
                        () => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.allBanners.length; i++)
                          ECircularContainer(
                            width: 20,
                            height: 6,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor: controller.currentIndex == i
                                ? EColors.primary
                                : EColors.grey,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

        }
    );
  }
}
