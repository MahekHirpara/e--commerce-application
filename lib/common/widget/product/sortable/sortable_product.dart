import 'package:e_commerce_app/features/shop/controller/all_product_controller.dart';
import 'package:e_commerce_app/features/shop/modal/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/size.dart';
import '../../layout/grid_layout.dart';
import '../product_cart/product_cart_vertical.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key, required this.products,
  });

  final List<ProductModal> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            items: [
              'Name',
              'Higher Price Product',
              'Lower Price Product',
              'Sale',
              'Newest',
              'Popularity',
            ]
                .map((option) =>
                DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {
              controller.sortProducts(value!);
            }),
        const SizedBox(
          height: ESize.spaceBtwSection,
        ),

        //Products
        Obx(
    () => EGrideLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              return  GridVertical(product: controller.products[index]);
            },
          ),
        ),
      ],
    );
  }
}