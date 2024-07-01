import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controller/product/favourite_controller.dart';
import '../icons/ECircleIcon.dart';

class EFavouriteIcon extends StatelessWidget {
  const EFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() {
      return  ECircleButton(
        icon: controller.isFavorites(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorites(productId) ? EColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      );
    });
  }
}
