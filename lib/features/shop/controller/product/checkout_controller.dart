import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modal/payment_method_modal.dart';
import '../../screen/checkout/widget/payment_tile.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModal> selectedPaymentMethod =
      PaymentMethodModal.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModal(image: EImages.paypal, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_){
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(ESize.lg),
            child: Column(
              children: [
                const ESectionHeading(text: 'Selected Payment Method',showActionbutton: false,),
                const SizedBox(height: ESize.spaceBtwSection,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.paypal, name: 'Paypal')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.googlePay, name: 'Google Pay')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.visa, name: 'Visa')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.masterCard, name: 'masterCard')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.paytm, name: 'paytm')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
                PaymentTile(paymentMethod : PaymentMethodModal(image: EImages.creditCard, name: 'Credit Card')),
                const SizedBox(height: ESize.spaceBtwItems/2,),
              ],
            ),
          ),
        );
      }
    );
  }
}


