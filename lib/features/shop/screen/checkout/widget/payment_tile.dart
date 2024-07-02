import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/features/shop/controller/product/checkout_controller.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/color.dart';
import '../../../../../utils/constant/size.dart';
import '../../../modal/payment_method_modal.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModal paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    final dark = EHelperFunction.isDarkMode(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: ECircularContainer(
        width: 60,
        height: 35,
        backgroundColor: dark ? EColors.light : EColors.white,
        padding: const EdgeInsets.all(ESize.sm),
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
