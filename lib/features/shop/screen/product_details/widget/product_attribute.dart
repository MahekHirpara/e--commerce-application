import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/product/product_price.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/chip/EChoice_chip.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/helper_function.dart';
import '../../../modal/product_modal.dart';

class EProductAttribute extends StatelessWidget {
  const EProductAttribute({super.key, required this.product});

  final ProductModal product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = EHelperFunction.isDarkMode(context);
    return Obx(
        ()=> Column(
        children: [
          //Selected Attributr Pricing & Description
          if (controller.selectedVariation.value.id.isNotEmpty)
            ECircularContainer(
              padding: const EdgeInsets.all(ESize.md),
              backgroundColor: dark ? EColors.darkerGrey : EColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title,Price and Stock Status
                  Row(
                    children: [
                      const ESectionHeading(
                        text: 'Variation',
                        showActionbutton: false,
                      ),
                      const SizedBox(
                        width: ESize.spaceBtwItems,
                      ),
                      //Actual Price
                      Column(
                        children: [
                          //price
                          Row(
                            children: [
                              const EProductTitleText(
                                title: 'Price',
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: ESize.spaceBtwItems,
                              ),
                              if(controller.selectedVariation.value.salePrice>0)
                              Text(
                                '\$${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: ESize.spaceBtwItems,
                              ),
                              //Sale Price
                               EProductPrice(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),
                          //stock
                          Row(

                            children: [
                               EProductTitleText(
                                title:'Stock',
                                smallSize: true,
                              ),
                              const SizedBox(
                                width: ESize.spaceBtwItems,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  //variation
                   EProductTitleText(
                    title:
                        controller.selectedVariation.value.description!,
                    smallSize: true,
                    maxline: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: ESize.spaceBtwSection / 2.5,
          ),

          //Attribute
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ESectionHeading(
                          text: attribute.name!,
                          showActionbutton: false,
                        ),
                        const SizedBox(
                          height: ESize.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map(
                                (values) {
                                  final isSelected = controller
                                          .selectedAttributes[attribute.name] ==
                                      values;
                                  final available = controller
                                      .getAttributeAvailabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(values);
                                  return EChoiceChip(
                                    text: values,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  values);
                                            }
                                          }
                                        : null,
                                  );
                                },
                              ).toList()),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
