import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/icons/ECircleIcon.dart';
import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/product/product_cart/product_cart_vertical.dart';
import 'package:e_commerce_app/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: EAppBar(
        title: Text('WishList' ,style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          ECircleButton(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              EGrideLayout(
                  itemCount: 6,
                  itemBuilder: (_,index){
                    return const GridVertical();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
