import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screen/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/utils/constant/color.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/loaders/full_screen_loader.dart';
import '../../../../navigation_menu.dart';
import '../checkout/checkout.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(
          () {

            final empty = FullScreenLoader(
              text: 'Whoops,Cart is Empty',
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPresed:  () => Get.to(()=> const NavigationMenu()),
            );


            if (cartController.cartItems.isEmpty) {
              return empty;
            } else {
              return const SingleChildScrollView(
                child: Padding(
                padding: EdgeInsets.all(ESize.defaultSpace),
                child: ECartItems(),
                            ),
              );
            }
          }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESize.defaultSpace),
        child: ElevatedButton(onPressed: (){
          Get.to(() => const CheckoutScreen());
        },child:  Obx(()=> Text('Checkout \$${cartController.totalCartPrice.value}')),),
      ),
    );
  }
}


