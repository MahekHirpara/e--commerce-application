import 'package:e_commerce_app/common/widget/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/text/section_heading.dart';
import 'package:e_commerce_app/features/shop/screen/brand/brand_products.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/brand_cart/brand_card.dart';


class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESize.defaultSpace),
          child: Column(
            children: [
              //heading
              const ESectionHeading(text: 'Brands',showActionbutton: false,),
              const SizedBox(height: ESize.spaceBtwItems,),
              
              //brands
              EGrideLayout(
                mainAxisExtent: 80,
                itemCount: 6, itemBuilder: (_,index){
                return EBrandcard(showborder: true,onPressed: (){
                  Get.to(()=>const BrandProducts());
                },);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
