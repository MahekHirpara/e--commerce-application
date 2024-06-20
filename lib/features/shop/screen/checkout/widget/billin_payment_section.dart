import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        ESectionHeading(text: 'Payment Method',btnTitle:'Change',onPressed: (){},),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Row(
          children: [
            ECircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? EColors.light:EColors.white,
              padding: const EdgeInsets.all(ESize.sm),
              child: const Image(image: AssetImage(EImages.paypal),fit: BoxFit.contain
                ,),
            ),
            const SizedBox(height: ESize.spaceBtwItems/2,),
            Text('Paypal',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        )
      ],
    );
  }
}
