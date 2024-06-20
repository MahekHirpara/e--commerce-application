
import 'package:e_commerce_app/features/shop/screen/all_product/all_product.dart';
import 'package:e_commerce_app/features/shop/screen/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screen/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screen/home/widgets/promp_slider.dart';
import 'package:e_commerce_app/utils/constant/image_string.dart';
import 'package:e_commerce_app/utils/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/custom_shap/container/primary_header_container.dart';
import '../../../../common/widget/custom_shap/container/serach_container.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/product/product_cart/product_cart_vertical.dart';
import '../../../../common/widget/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EPrimaryHeader(
              child: Column(
                children: [
                  //appbar
                  HomeAppBar(),
                  SizedBox(
                    height: ESize.spaceBtwSection,
                  ),
                  //searchbar
                  ESearchBar(
                    text: 'Search to Store',
                  ),
                  SizedBox(
                    height: ESize.spaceBtwSection,
                  ),
                  //catagory
                  Padding(
                    padding: EdgeInsets.only(left: ESize.defaultSpace),
                    child: Column(
                      children: [
                        ESectionHeading(
                          text: 'Popular Categories',
                          showActionbutton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: ESize.spaceBtwItems,
                        ),
                        HomeCategories(),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: ESize.spaceBtwSection,
                  ),
                ],
              ),
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(ESize.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(banner: [EImages.promo1,EImages.promo2,EImages.promo3,EImages.promo4,],),
                  const SizedBox(height: ESize.spaceBtwSection,),
                  //heading
                  ESectionHeading(text:"Popular product",onPressed:(){
                    Get.to(()=>const AllProductScreen());
                  },showActionbutton: true,),
                  const SizedBox(height: ESize.spaceBtwItems,),
                  //add to cart button
                  EGrideLayout(
                    itemCount: 6,
                    itemBuilder: (_,index){
                    return const GridVertical();
                  },),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




