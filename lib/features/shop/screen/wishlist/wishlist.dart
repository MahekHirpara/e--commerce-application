
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/icons/ECircleIcon.dart';
import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';

import 'package:e_commerce_app/common/widget/product/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_app/common/widget/vertical_product_shimmer.dart';
import 'package:e_commerce_app/features/shop/controller/product/favourite_controller.dart';

import 'package:e_commerce_app/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/navigation_menu.dart';

import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/loaders/full_screen_loader.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: EAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
        actions: [
          ECircleButton(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              Obx(
              ()=> FutureBuilder(
                    future: controller.favoritesProduct(),
                    builder: (context, snapshot) {
                      final emptyWidget = FullScreenLoader(
                        text: 'Whoops! Whishlist is empty',
                        showAction: true,
                        actionText: 'Let\'s add some,',
                        onActionPresed: () => Get.off(() => const NavigationMenu()),
                      );

                      const loader = EVerticalProductShimmer();
                      final widget =
                          ECloudHelperFunction.checkMultipleRecordState(
                              snapshot: snapshot, loader: loader,nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return EGrideLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) {
                            return GridVertical(
                              product: products[index],
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
