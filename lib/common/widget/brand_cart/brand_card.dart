import 'package:e_commerce_app/features/shop/modal/brand_modal.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/constant/enums.dart';
import '../../../utils/constant/size.dart';
import '../../../utils/helper/helper_function.dart';
import '../custom_shap/container/circular_container.dart';
import '../image/circularImage.dart';
import '../text/brand_title_with_verify_icon.dart';

class EBrandcard extends StatelessWidget {
  const EBrandcard({
    super.key,
    required this.showborder,
    this.onPressed,
    required this.brand,
  });

  final bool showborder;
  final void Function()? onPressed;
  final BrandModal brand;


  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: ECircularContainer(
        padding: const EdgeInsets.all(ESize.sm),
        showBorder: showborder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: ECircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? EColors.white:EColors.black,
              ),
            ),
            const SizedBox(width: ESize.spaceBtwItems/2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   BrandTExtWithVerifyIcon(title: brand.name, brandTextSize: TextSizes.large,),
                  Text('${brand.productsCount ?? 0} products', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}