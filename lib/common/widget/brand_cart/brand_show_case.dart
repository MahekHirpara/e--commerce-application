import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widget/shinmer.dart';
import 'package:e_commerce_app/features/shop/modal/brand_modal.dart';
import 'package:e_commerce_app/features/shop/screen/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/constant/size.dart';
import '../../../utils/helper/helper_function.dart';
import '../custom_shap/container/circular_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModal brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: ECircularContainer(
        showBorder: true,
        borderColor: EColors.darkerGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ESize.md),
        margin: const EdgeInsets.only(bottom: ESize.spaceBtwItems),
        child: Column(
          children: [
            //brand with product count
            EBrandcard(
              showborder: false,
              brand: brand,
            ),
            Row(
              children: images
                  .map((image) => bradTopProductImageWidget(image, context))
                  .toList(),
            )
            //brand top 3 products
          ],
        ),
      ),
    );
  }
}

Widget bradTopProductImageWidget(String image, context) {
  return Expanded(
    child: ECircularContainer(
      height: 100,
      backgroundColor: EHelperFunction.isDarkMode(context)
          ? EColors.darkerGrey
          : EColors.light,
      margin: const EdgeInsets.only(right: ESize.sm),
      padding: const EdgeInsets.all(ESize.md),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const EShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
