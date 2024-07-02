import 'package:e_commerce_app/common/widget/image/circularImage.dart';
import 'package:e_commerce_app/common/widget/product/product_price.dart';
import 'package:e_commerce_app/common/widget/product/product_title_text.dart';
import 'package:e_commerce_app/common/widget/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce_app/features/shop/controller/product_controller.dart';
import 'package:e_commerce_app/utils/constant/enums.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shap/container/circular_container.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';
import '../../../modal/product_modal.dart';

class EProductMEtaData extends StatelessWidget {
  const EProductMEtaData({super.key, required this.product});
  final ProductModal product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            //Sale TAg
            ECircularContainer(
              radius: ESize.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ESize.sm, vertical: ESize.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: EColors.black),
              ),
            ),
            const SizedBox(width: ESize.spaceBtwItems,),

            //price
            if(product.productType == ProductType.single.toString() && product.salePrice >0)
            Text('\$${product.price}',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice >0) const SizedBox(width: ESize.spaceBtwItems,),
             EProductPrice(price: controller.getProductPrice(product) ,isLarge: true,),
          ],
        ),
        const SizedBox(height: ESize.spaceBtwItems/1.5,),

        //Title
         EProductTitleText(title: product.title),
        const SizedBox(height: ESize.spaceBtwItems/1.5,),
        
        //Stock Status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESize.spaceBtwItems,),
            Text(controller.getStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        
        const SizedBox(height: ESize.spaceBtwItems/1.5,),

        //Brand
        Row(
          children: [
            ECircularImage(
              isNetworkImage: true,
                image:product.brand != null ? product.brand!.image : '',
              width: 32,
                height: 32,
              overlayColor: dark ? EColors.white : EColors.black,
            ),
            const SizedBox(height: ESize.spaceBtwItems/1.5,),
             BrandTExtWithVerifyIcon(title: product.brand != null ? product.brand!.name : '',brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
