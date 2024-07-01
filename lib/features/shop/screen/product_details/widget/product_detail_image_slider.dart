import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widget/fav_icon/favourite_icon.dart';
import 'package:e_commerce_app/features/shop/controller/product/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/custom_shap/curved_edges/curve_edget_widget.dart';
import '../../../../../common/widget/icons/ECircleIcon.dart';
import '../../../../../common/widget/image/rounded_image.dart';
import '../../../../../common/widget/shinmer.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/helper_function.dart';
import '../../../modal/product_modal.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModal product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    final dark = EHelperFunction.isDarkMode(context);
    return ECruvedEdgesWidget(
      child: Container(
        color: dark ? EColors.darkerGrey : EColors.light,
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(ESize.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: ()=> controller.showEnlargedImages(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                        const EShimmerEffect(width: 55, height: 55,radius: 55,),

                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: ESize.defaultSpace,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Obx(() {

                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return ERoundedImage(
                        isNetworkImage: true,
                        width: 70,
                        fit: BoxFit.cover,
                        backgroundColor: dark ? EColors.light : EColors.dark,
                        onPressed: () =>controller.selectedProductImage.value = images[index],
                        border: Border.all(color: imageSelected? EColors.primary : Colors.transparent),
                        padding: const EdgeInsets.all(ESize.sm),
                        imageurl: images[index],
                      );
                    });
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    width: ESize.spaceBtwItems,
                  ),
                  itemCount: images.length,
                ),
              ),
            ),
             EAppBar(
              // title: Text('product details') ,
              showBackArrow: true,
              actions: [
                EFavouriteIcon(productId: product.id,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
