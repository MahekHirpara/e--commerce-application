import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/features/shop/controller/home_indicator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../common/widget/image/rounded_image.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banner,
  });

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeIndicatorController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index,_)=> controller.updatePageIndicator(index)
          ),
          items: banner.map((url) => ERoundedImage(imageurl: url,applyimageRadius: true,fit: BoxFit.cover,padding: const EdgeInsets.only(right: ESize.sm),)).toList(),

        ),
        const SizedBox(height: ESize.spaceBtwItems),
        Center(
          child: Obx(
              () =>Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for(int i =0;i<banner.length;i++)  ECircularContainer(width: 20,height: 6,margin:const EdgeInsets.only(right:10),backgroundColor: controller.currentIndex == i ? EColors.primary :EColors.grey ,),
                ],
              ),
          ),
        ),

      ],
    );
  }
}