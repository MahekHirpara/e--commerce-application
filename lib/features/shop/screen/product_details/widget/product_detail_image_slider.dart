import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/custom_shap/curved_edges/curve_edget_widget.dart';
import '../../../../../common/widget/icons/ECircleIcon.dart';
import '../../../../../common/widget/image/rounded_image.dart';
import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/size.dart';
import '../../../../../utils/helper/helper_function.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ECruvedEdgesWidget(
      child: Container(
        color: dark ? EColors.darkerGrey : EColors.light,
        child: Stack(children: [
          //Main Large Image
          const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(ESize.productImageRadius * 2),
              child: Center(
                child: Image(
                  image: AssetImage(EImages.shoes1),
                ),),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            left: ESize.defaultSpace,
            child: SizedBox(
              height: 70,
              child:  ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return ERoundedImage(
                      width: 70,
                      fit: BoxFit.cover,
                      backgroundColor: dark ? EColors.dark : EColors.white,
                      border: Border.all(color: EColors.primary),
                      padding: const EdgeInsets.all(ESize.sm),
                      imageurl: EImages.promo1);
                },
                separatorBuilder: (_, __) =>
                const SizedBox(width: ESize.spaceBtwItems,),
                itemCount: 6,


              ),
            ),
          ),
          const EAppBar(
            // title: Text('product details') ,
            showBackArrow: true,
            actions: [
              ECircaleButton(
                icon: Iconsax.heart5,
                color: Colors.red,
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}