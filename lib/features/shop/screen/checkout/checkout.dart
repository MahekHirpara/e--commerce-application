import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/custom_shap/container/circular_container.dart';
import 'package:e_commerce_app/features/shop/screen/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screen/checkout/widget/billin_payment_section.dart';
import 'package:e_commerce_app/features/shop/screen/checkout/widget/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/screen/checkout/widget/billing_amount_section.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:e_commerce_app/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/product/cart/copuen_widget.dart';
import '../../../../common/widget_login_sing_up/success.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constant/color.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(
        title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              const ECartItems(showAddRemoveButton: false,),
              const SizedBox(height: ESize.spaceBtwSection,),

              //Coupan TextField
              const ECoupenCode(),
              const SizedBox(height: ESize.spaceBtwSection,),

              //Billing Section
              ECircularContainer(
                padding: const EdgeInsets.all(ESize.md),
                showBorder: true,
                backgroundColor: dark? EColors.black : EColors.white,
                child: const Column(
                  children: [
                    //pricing
                    EBillingAmountSection(),
                    SizedBox(height: ESize.spaceBtwItems,),

                    //Divider
                    Divider(),
                    SizedBox(height: ESize.spaceBtwItems,),

                    //Payment Methods
                    EBillingPaymentSection(),
                    SizedBox(height: ESize.spaceBtwItems,),

                    //Address
                    EBilingAddressSection(),
                    SizedBox(height: ESize.spaceBtwItems,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESize.defaultSpace),
        child: ElevatedButton(onPressed: (){
          Get.to(() =>  SuccessScreen(
            image: EImages.payment_success, title: 'Payment Successful', subTitle: 'Your Item will be shipped soon!', onpressed: () {
              Get.offAll(() =>const NavigationMenu());
          },
          ));
        },child: const Text('Checkout \$25'),),
      ),
    );
  }
}


