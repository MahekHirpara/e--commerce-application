import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/controller/product/checkout_controller.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        ESectionHeading(text: 'Payment Method',btnTitle:'Change',onPressed: (){
          controller.selectPaymentMethod(context);
        },),
        const SizedBox(height: ESize.spaceBtwItems/2,),
        Obx(
          ()=> Row(
            children: [
              ECircularContainer(
                width: 60,
                height: 35,

                backgroundColor: dark? Colors.transparent:EColors.white,
                padding: const EdgeInsets.all(ESize.sm),
                child:  Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain
                  ,),
              ),
              const SizedBox(width: ESize.spaceBtwItems/2,),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
        )
      ],
    );
  }
}
