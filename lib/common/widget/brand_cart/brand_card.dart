import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/constant/enums.dart';
import '../../../utils/constant/image_string.dart';
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

  });

  final bool showborder;
  final void Function()? onPressed;


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
                image: EImages.nike,
                isNetworkImage: false,
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
                  const brantitle_text_with_verifyicon(title: 'Nike', brandTextSize: TextSizes.large,),
                  Text('256 product with Sdfvbgf', overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}