import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/product/product_price.dart';
import 'package:e_commerce_app/features/shop/screen/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import '../checkout/checkout.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(ESize.defaultSpace),
        child: ECartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESize.defaultSpace),
        child: ElevatedButton(onPressed: (){
          Get.to(() => const CheckoutScreen());
        },child: const Text('Checkout \$25'),),
      ),
    );
  }
}


